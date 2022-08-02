# Maintainer: DashCruft dashcruft@gmail.com
pkgname=lazap
pkgver=0.4.0
pkgrel=1
pkgdesc="Lazap, All your games at one library with a modernish look and experience."
arch=("armv7h" "i686" "x86_64")
license=(CC)
makedepends=()
optdepends=()
provides=(lazap)
conflicts=(lazap)
source=("lazap.desktop")
sha256sums=('c5c66e36202836f10e22e419cf129f01fef570ab458a04aadb49e1ea325c3465')

prepare() {
curl -s https://api.github.com/repos/Lazap-Development/lazap/releases/latest \
| grep "browser_download_url.*zst" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - -O lazap.tar.zst

 tar --use-compress-program=unzstd -xvf lazap.tar.zst
	echo "Prepare Complete!"
}

package() {
    install -Dm644 "${srcdir}/lazap.desktop" "${pkgdir}/usr/share/applications/lazap.desktop"
    ln -sf "src/usr/bin" "${pkgdir}/usr/bin/lazap"

    echo "Packaging Complete!"
}