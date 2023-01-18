# Maintainer: soloturn@gmail.com

_npmname=editly
pkgname=nodejs-$_npmname # All lowercase
pkgver=0.14.2
pkgrel=0
pkgdesc='create video from a set of clips, images and titles, NLE, non-linear video editing'
arch=('any')
url='https://github.com/mifi/editly'
license=('MIT')
depends=('ffmpeg' 'nodejs')
makedepends=('npm')
options=(!emptydirs)

package() {
  npm install --user root -g --prefix="${pkgdir}"/usr ${_npmname}@${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../../lib/node_modules/${_npmname}/LICENSE" \
     "${pkgdir}/usr/share/licenses/${pkgname}"

  # Clean up
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||g" -e "s|${srcdir}||g" -i {} \; \
       -or -name ".*" -type f -exec rm '{}' \; \
       -or -name ".*" -type d -prune -exec rm -r '{}' \; \
       -or -name "benchmark" -type d -prune -exec rm -r '{}' \; \
       -or -name "man" -type d -prune -exec rm -r '{}' \; \
       -or -name "test" -type d -prune -exec rm -r '{}' \; \
       -or -name "tests" -type d -prune -exec rm -r '{}' \; \
       -or ! -type l -perm /022 -exec chmod g-w,o-w '{}' \;
}

# vim:set ts=2 sw=2 et:

