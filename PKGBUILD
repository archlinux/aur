# Maintainer: imtbl <imtbl at mser dot at>
pkgname=soundsense-rs-git
_pkgname=soundsense-rs
pkgver=1.5.1.travis.r8.g055acfb
pkgrel=1
pkgdesc="A Rust version of SoundSense"
arch=('x86_64')
url="https://github.com/prixt/${_pkgname}"
license=('MIT')
makedepends=('rust' 'alsa-lib' 'gtk3' 'webkit2gtk')
source=("git+https://github.com/prixt/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked
}

package() {
  depends+=('libasound.so' 'libgtk-3.so' 'libgdk-3.so' 'libwebkit2gtk-4.0.so'
            'libjavascriptcoregtk-4.0.so')

  cd "${srcdir}/${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
