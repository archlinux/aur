# Maintainer: shyam (shyamganesh01@gmail.com)

_base=PEASS-ng
pkgname=peass-ng
pkgver=188479ae
_pkgver=20230903
pkgrel=1
pkgdesc="Privilege Escalation Awesome Scripts SUITE new generation"
arch=(any)
url="https://github.com/carlospolop/PEASS-ng"
license=(MIT)
source=("git+https://github.com/carlospolop/PEASS-ng.git")
makedepends=('git' 'github-cli')
sha512sums=(SKIP)

pkgver() {
  cd "${_base}"
  git describe --tags | cut -d '-' -f 2
}

prepare() {
  cd ${_base}
  gh release download --pattern '*' -D release -R ${url} --clobber 
}

package() {

  cd ${_base}/release

  # Install to /usr/share/peass-ng 

  ## Linux
  find . -name "lin*" -printf "%f\n" -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/linux/{}" \;

  ## Windows
  find . -name "win*" -printf "%f\n" -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/windows/{}" \;

  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

