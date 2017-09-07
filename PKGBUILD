# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>

pkgname=gitkraken
pkgrel=2
pkgver=3.0.0
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client."
url="https://www.gitkraken.com/"
provides=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib' 'libcurl-openssl-1.0' 'libxss' 'rtmpdump')
optdepends=('git-lfs: git-lfs support')
makedepends=()
backup=()
install=''
source=(
    "${pkgname}-${pkgver}.tar.gz::https://release.gitkraken.com/linux/v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "gitkraken.png"
    "eula.html"
    "gitkraken.sh"
)
sha256sums=('858965351fb9302c7f4e3d65741afd695e92fe9078a1ffca19f51c62437625d7'
            'c001122608370bc43d6cfefd8e217f337a07f544c351179e816983635f8ff45d'
            'a2b3551f83bcbe56da961615f066bb736cd15d98e41c93b3b4add0d56606d902'
            '9566342308bf35b56e626fa1b0d716eb16991712cc43b617c4f0d95e005311d1'
            '28c1e28104c23937404448c38ee26dac75c01fb4398e1fad057599da24135b9e')

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
