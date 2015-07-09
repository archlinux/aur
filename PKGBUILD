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
depends=(desktop-file-utils hicolor-icon-theme lib32-alsa-lib lib32-bzip2 lib32-curl lib32-gtk2 lib32-libxdamage lib32-libxt lib32-nss)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
install=$pkgname.install
source=(hib://Machinarium_full_en.tar.gz
    $pkgname.desktop
    http://dl.dropbox.com/u/3395784/aur/$pkgname/$pkgname.png
    $pkgname.sh
    http://dl.dropbox.com/u/3395784/aur/$pkgname/$pkgname-browser.swf)
sha256sums=('bf038f8d47448896f97f6a8a599699a9f53b44e31ae46779b24d3d615e99e86b'
    'da021ff4e5e3e6a340a1601856b75ac7be2e3a74bc6feca0487712638dccc34d'
    '0349c7b9e4fcc59e34f155a98694e9c1519fcd8e66117e32ee0aee4344b76204'
    'e4798a56df38254e54a1e147e82870ac759743131a3d879462730ab046ee2d69'
    '8d129d89754666de64d67a12660b268c254d5832b4356aafca01830a2e104877')
sha512sums=('5fbaa215b58ef5a5a9a048e6f5569e22a4816c608407d3e3cf585b03271933b6e33cda50e974b651613eb2454c7c00e2c5060caa46a08e360e927e1e4b7b8aa3'
    'a82db5ce8fff73e1d03e90ee59fbfaeb8076955afd3cca98ae9cb23ccd67300fa6f722831f120a5179cb006c319a89db8b513933f11656fdf31162a15567edb6'
    '3c5ea1968a7251960c4801312009d765d01a56fd1ede44e16ae15eda657a1a8d7372d0ba8478d6d51521fad70c4cb659fe5451c467f62ef895365de10908e7c2'
    '5a23583a9d96e184be77a876c4aa4c3540b3e0be3a7e49adfcf700dff06ee6a87f798dd63de6cf00bf0e9c5eaf0303fb53fa5a5c5da6c63c3b1ab8c25d3feab9'
    '92e0ea781266d2c7cc7e1da05f2032b67e3ad85dc3a02b5af381cf2795f88e8e09db429e8c4ae3e12089bb35ae29c1f648575c71657872f229c1cb13ccf93e7b')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
PKGEXT='.pkg.tar'

package() {
    install -Dm644 $pkgname-browser.swf "$pkgdir"/usr/share/games/$pkgname/$pkgname-browser.swf
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/icons/$pkgname.png
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/

    cp -r Machinarium/* "$pkgdir"/usr/share/games/$pkgname/
    cd "$pkgdir"/usr/share/games/$pkgname/
    find -type d -exec chmod 755 {} \;
    find -type f -exec chmod 644 {} \;
    chmod 755 Machinarium
}
