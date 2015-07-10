# Maintainer: Limao Luo <luolimao@gmail.com>
# Contributor: Marek Otahal <markotahal@gmail.com>
# Contributor: Gen2ly <toddrpartridge@gmail.com>

pkgname=machinarium
pkgver=3
pkgrel=14
pkgdesc="A point-and-click logic adventure game by the creators of Samorost (requires copy of the full game)"
arch=(i686 x86_64)
url=http://machinarium.net/
license=(unknown)
depends_i686=(desktop-file-utils hicolor-icon-theme)
depends_i686=(alsa-lib bzip2 curl gtk2 libxdamage libxt nss)
depends_x86_64=(lib32-alsa-lib lib32-bzip2 lib32-curl lib32-gtk2 lib32-libxdamage lib32-libxt lib32-nss)
install=$pkgname.install
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
PKGEXT='.pkg.tar'

source=(hib://Machinarium_full_en.tar.gz
        $pkgname.sh
        $pkgname.desktop
        https://apps.ubuntu.com/site_media/icons/2015/07/machinariumIjgfeQ.png
        http://dl.dropbox.com/u/3395784/aur/machinarium/machinarium-browser.swf)
sha1sums=('b0cd45fa1d75b29a9cb761f96ef398cec29d8c12'
          'e78be4e1e9752586188dce39e24da457711ee5b3'
          '1febb90a558e55cb42531cac96bfb3d07698fef8'
          'eeb580db1ecce734ad9b1b7a4d59f4ce43ea750a'
          '8f5a30be012632538d46fd815277f2cee1edb80b')

package() {
    install -Dm644 $pkgname-browser.swf "$pkgdir"/usr/share/games/$pkgname/$pkgname-browser.swf
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
    install -Dm644 machinariumIjgfeQ.png "$pkgdir"/usr/share/icons/$pkgname.png
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/

    cp -r Machinarium/* "$pkgdir"/usr/share/games/$pkgname/
    cd "$pkgdir"/usr/share/games/$pkgname/
    find -type d -exec chmod 755 {} \;
    find -type f -exec chmod 644 {} \;
    chmod 755 Machinarium
}
