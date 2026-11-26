# Maintainer: Fabio Di Giorgio <ravnos at duck dot com>
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>
# Contributor: William Penton <william@penton.us>
# Contributor: Jeff Moody <jeff@fifthecho.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=gitkraken-standalone
pkgrel=2
pkgver=12.7.0
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client. Serverless version (requires license file)."
url="https://help.gitkraken.com/gitkraken-desktop/serverless/"
provides=('gitkraken')
conflicts=('gitkraken')
arch=('x86_64' 'aarch64')
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'e2fsprogs' 'expat' 'fontconfig'
         'gcc-libs' 'glib2' 'glibc' 'gtk3' 'krb5' 'libcups' 'libdrm' 'libgcrypt'
         'libnotify' 'libsecret' 'libudev.so' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxkbfile' 'libxrandr'
         'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'xdg-utils' 'zlib')
optdepends=('git-lfs: git-lfs support'
            'org.freedesktop.secrets: Provides ways to store passwords and encryption keys')
makedepends=()
backup=()
install=''
source=(
    "GitKraken.desktop"
    "eula.html"
    "gitkraken.sh"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://api.gitkraken.dev/releases/standalone/production/linux/x64/${pkgver}/gitkraken-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://api.gitkraken.dev/releases/standalone/production/linux/arm64/${pkgver}/gitkraken-aarch64.tar.gz")
sha256sums=('078fa2cdf6826d956bf73387fb2ef147b1aca5f4a7a3cb4be8c71e6105fc9c6c'
            '5b7b39b331bc32a606e1e79c695df4519c9b220225be00fb34ef368c3af319a6'
            '6e6c6ac37287e1ec5d5266689a49d18899488be901b21f5cb9749f545453626f')
sha256sums_x86_64=('5f22c65b95d7520b12f98df072906d8576f8b6d23d53af1c26ba3aee2885ec63')
sha256sums_aarch64=('e3d682eb32e8b0e2541ea0fac6b9ecf846d2119f2f37913f3d71599028a11dfb')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/gitkraken "$pkgdir"/opt/gitkraken

    install -d "$pkgdir"/usr/bin

    install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "$pkgdir/opt/gitkraken/gitkraken.png" "$pkgdir/usr/share/pixmaps/gitkraken.png"
}
