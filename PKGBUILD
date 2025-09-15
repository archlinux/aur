# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='wayback'
pkgname='wayback-git'
pkgver=0.20.1.r16.g1a7f080
pkgrel=1
pkgdesc='Web archiving and playback tool that allows users to capture and preserve web content'
arch=('x86_64')
url='https://github.com/wabarc/wayback'
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'go'
)
optdepends=(
  'chromium'
  'ffmpeg'
  'libwebp'
  'nss'
  'tor'
  'youtube-dl'
  'wget'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make linux-amd64
}

package() {
  cd "${pkgname}"
  install -Dm755 "build/binary/${_pkgname}-linux-amd64" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 "build/systemd/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

