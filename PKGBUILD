# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386' 'armv6h')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
_url="$url/releases/download/v$pkgver/${_name}_${pkgver}_linux"
source_x86_64=("${_url}_amd64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_386.tar.gz")
source_armv6h=("${_url}_armv6.tar.gz")
sha256sums_x86_64=('106e1951fb19bde0307189b047d1ca6c48df5bf9032cb44731f2492d095f29fd')
sha256sums_arm64=('0af152e80e2bd2eb20c72ea8611916ab413fc9d64b0ea16aeb165920adc485cc')
sha256sums_i386=('b2302a83097cb3416146035bb6acba57ba69acefae458a08a261a6d9bc094861')
sha256sums_armv6h=('15f25adcbbe8af107c2d1729aa066657a271284fa759a54078b414fdf52283a1')

pkgver() {
  curl --silent -L "https://api.github.com/repos/raitonoberu/${_name}/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                                                 # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |
    sed 's/v//'
}

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
