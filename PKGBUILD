# Maintainer: Krzysztof Demir Kuźniak <krysztofdemirkuzniak@gmail.com>
pkgname=linux-postmarketos-qcom-sm7125-bin
pkgver=6.14.7
pkgrel=12.2
pkgdesc="Prebuilt PostmarketOS kernel for QCOM SM7125 (built as RPM on build.opensuse.org from github.com/linux-sm7125, original postmarketOS package uses .apk format)"
arch=('aarch64')
url="https://build.opensuse.org/package/show/home:kuznix:postmarketos-kernel-ports/kernel-postmarketos-qcom-sm7125"
license=('GPL')
depends=()
makedepends=('rpmextract')
source=("https://download.opensuse.org/repositories/home:/kuznix:/postmarketos-kernel-ports/openSUSE_Tumbleweed/aarch64/kernel-postmarketos-qcom-sm7125-${pkgver}-${pkgrel}.aarch64.rpm")
sha256sums=('SKIP')  # Replace with actual sha256sum if needed

package() {
    # Extract RPM
    rpmextract.sh "$srcdir/kernel-postmarketos-qcom-sm7125-${pkgver}-${pkgrel}.aarch64.rpm" "$pkgdir/"

    # Ensure modules are installed under /lib/modules
    install -dm755 "$pkgdir/lib/modules"

    # Symlink kernel image
    install -dm755 "$pkgdir/boot"
    ln -sf "/lib/modules/${pkgver}-${pkgrel}-postmarketos-qcom-sm7125/vmlinuz" "$pkgdir/boot/vmlinuz-postmarketos-qcom-sm7125"
}
