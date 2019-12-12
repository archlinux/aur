# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>
# Contributor: William Penton <william@penton.us>

pkgname=gitkraken-standalone
pkgrel=1
pkgver=6.4.0
pkgdesc="Stand-alone version of GitKraken for labs and computers without internet access (requires license file)."
url="https://support.gitkraken.com/standalone/standalone/"
provides=('gitkraken')
conflicts=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('nss' 'libxtst' 'libgnome-keyring' 'alsa-lib' 'libxss' 'desktop-file-utils')
optdepends=('git-lfs: git-lfs support')
makedepends=()
backup=()
install=''
source=(
    "${pkgname}-${pkgver}.tar.gz::https://release.axocdn.com/linux-standalone/GitKraken-v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
)

sha256sums=('3b58aedad591a18fba7b74d749a8a09a21a24c12b7936cf0e5e6a6d84571af36'
            '81b32ad2fae47fcdf8adb4fdb5c734430ed993f712e75bd62297ae8540fdf889'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '9566342308bf35b56e626fa1b0d716eb16991712cc43b617c4f0d95e005311d1'
            '6e6c6ac37287e1ec5d5266689a49d18899488be901b21f5cb9749f545453626f')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/gitkraken "$pkgdir"/opt/gitkraken

    find "$pkgdir"/opt/gitkraken/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/gitkraken/gitkraken

    install -d "$pkgdir"/usr/bin

    install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "./gitkraken.png" "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}
