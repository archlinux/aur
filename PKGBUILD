# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: gigas002 <gigas002@pm.me>

pkgname=carbonyl-git
_pkgname=carbonyl
pkgver=r88.ab80a27
pkgrel=2
pkgdesc="Chromium-based browser built to run in a terminal"
arch=('x86_64')
url="https://github.com/fathyb/carbonyl"
license=('BSD')
options=(!strip)
depends=(nss alsa-lib expat nspr glibc gcc-libs)
makedepends=(npm git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            '07d6361edfa45d58a2d81e527f1a976fef9ba5417daa0ff8b4acfdfc95f8032e')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$_pkgname"
  npm install --cache "${srcdir}/npm-cache" $_pkgname
}


package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
    mv ${srcdir}/${_pkgname}/node_modules/@fathyb/carbonyl-linux-amd64/build/* ${pkgdir}/opt/${_pkgname}
    cd ..
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
