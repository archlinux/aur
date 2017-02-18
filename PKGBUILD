# Maintainer: LA-MJ <4mr.minj+aur [at] g-mail>

_npmname=addons-linter
pkgname=nodejs-$_npmname # All lowercase
pkgver=0.15.15
pkgrel=1
pkgdesc='The Add-ons Linter, JS edition.'
arch=('any')
url='https://github.com/mozilla/addons-linter'
license=('MPL')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)

package() {
  npm install --user root -g --prefix="${pkgdir}"/usr ${_npmname}@${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../../lib/node_modules/${_npmname}/LICENSE" \
     "${pkgdir}/usr/share/licenses/${pkgname}"

  # Clean up
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \; \
       -or -name ".*" -type f -exec rm '{}' \; \
       -or -name ".*" -type d -prune -exec rm -r '{}' \; \
       -or -name "benchmark" -type d -prune -exec rm -r '{}' \; \
       -or -name "man" -type d -prune -exec rm -r '{}' \; \
       -or -name "test" -type d -prune -exec rm -r '{}' \; \
       -or -name "tests" -type d -prune -exec rm -r '{}' \; \
       -or ! -type l -perm /022 -exec chmod g-w,o-w '{}' \;
}
