# Maintainer: Jay Ta'ala <jay@jaytaala.com>
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
pkgrel=1
pkgver=9.1.0
pkgdesc="Stand-alone version of GitKraken for labs and computers without internet access (requires license file)."
url="https://support.gitkraken.com/standalone/standalone/"
provides=('gitkraken')
conflicts=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('nss' 'gtk3' 'libsecret' 'libxkbfile')
optdepends=('git-lfs: git-lfs support'
            'org.freedesktop.secrets: Provides ways to store passwords and encryption keys')
makedepends=()
backup=()
install=''
source=(
    "${pkgname}-${pkgver}.tar.gz::https://release.axocdn.com/linux-standalone/GitKraken-v${pkgver}.tar.gz"
    "GitKraken.desktop"
    "eula.html"
    "gitkraken.sh"
)
sha256sums=('30875abde99b7ca912c123ee1305a2b2381b131f5ce62910806425facaeab78b'
            'f4a63737eccf279b0b131fe34e4a711aaf0dd5be86e932baf2593069553ef3b1'
            '5b7b39b331bc32a606e1e79c695df4519c9b220225be00fb34ef368c3af319a6'
            '6e6c6ac37287e1ec5d5266689a49d18899488be901b21f5cb9749f545453626f')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/gitkraken "$pkgdir"/opt/gitkraken

    find "$pkgdir"/opt/gitkraken/ -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir"/opt/gitkraken/gitkraken
    chmod 755 "$pkgdir"/opt/gitkraken/resources/app.asar.unpacked/src/js/redux/domain/AskPass/AskPass.sh
    chmod 755 "$pkgdir"/opt/gitkraken/resources/app.asar.unpacked/resources/cli/unix/gk
    chmod 755 "$pkgdir"/opt/gitkraken/resources/app.asar.unpacked/resources/cli/unix/gkrc
    chmod 4755 "$pkgdir"/opt/gitkraken/chrome-sandbox

    install -d "$pkgdir"/usr/bin

    install -D -m755 "./gitkraken.sh" "${pkgdir}/usr/bin/gitkraken"
    install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
    install -D -m644 "./GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
    install -D -m644 "$pkgdir/opt/gitkraken/gitkraken.png" "$pkgdir/usr/share/pixmaps/gitkraken.png"
}
