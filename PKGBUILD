# Maintainer: Andrew Crerar <andrew (at) crerar (dot) io>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Sebastian Stammler <stammler.s@gmail.com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=ttf-google-fonts-git
pkgver=r1210.787dfb1f
pkgrel=1
epoch=1
pkgdesc="TrueType fonts from the Google Fonts project (git version)"
arch=(any)
url="https://github.com/google/fonts"
license=('custom:SIL Open Font License' 'custom:Ubuntu Font License v1.0')

depends=(fontconfig
         xorg-mkfontdir
         xorg-mkfontscale
         xorg-fonts-encodings
         noto-fonts
         noto-fonts-extra
         ttf-fira-sans
         ttf-fira-mono
         ttf-ubuntu-font-family
         ttf-croscore
         ttf-roboto
         ttf-inconsolata)
makedepends=(git)
conflicts=(adobe-source-code-pro-fonts adobe-source-sans-pro-fonts jsmath-fonts
           lohit-fonts ttf-andika ttf-anonymous-pro ttf-cardo ttf-comfortaa
           ttf-lato
           ttf-lora-cyrillic ttf-lekton ttf-medievalsharp ttf-merriweather
           ttf-merriweather-sans ttf-nova ttf-opensans ttf-oswald ttf-oxygen
           ttf-oxygen-git ttf-pt-fonts ttf-quintessential ttf-roboto-mono
           ttf-signika ttf-sil-fonts ttf-source-code-pro-ibx ttf-source-sans-pro-ibx ttf-vollkorn-ibx ttf-arabeyes-fonts)
provides=(adobe-source-code-pro-fonts adobe-source-sans-pro-fonts jsmath-fonts
          lohit-fonts ttf-andika ttf-anonymous-pro ttf-cardo ttf-comfortaa
          ttf-lato
          ttf-lora-cyrillic ttf-lekton ttf-medievalsharp ttf-merriweather
          ttf-merriweather-sans ttf-nova ttf-opensans ttf-oswald ttf-oxygen
          ttf-oxygen-git ttf-pt-fonts ttf-quintessential ttf-roboto-mono
          ttf-signika ttf-sil-fonts ttf-source-code-pro-ibx ttf-source-sans-pro-ibx ttf-vollkorn-ibx)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd fonts

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "$pkgdir/usr/share/fonts/TTF"
    find . -type f -name \*.[Tt][Tt][Ff] -exec install -Dm644 '{}' ${pkgdir}/usr/share/fonts/TTF \;

    # [fonts/ofl/notosanstamil, fonts/ofl/notoserif] provided by extra/noto-fonts
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "NotoSansTamil-*.ttf" -delete
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "NotoSerif-*.ttf" -delete

    # [fonts/ofl/notosans] provided by extra/noto-fonts-extra
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "NotoSans-*.ttf" -delete

    # [fonts/ofl/firasans] provided by community/ttf-fira-sans
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "FiraSans-*.ttf" -delete

    # [fonts/ofl/firamono] provided by community/ttf-fira-mono
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "FiraMono-*.ttf" -delete

    # [fonts/ufl/ubuntu, fonts/ufl/ubuntumono] provided by community/ttf-ubuntu-font-family
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "Ubuntu-*.ttf" -delete
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "UbuntuMono-*.ttf" -delete

    # [fonts/apache/tinos, fonts/apache/arimo, fonts/apache/cousine] provided by extra/ttf-croscore
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "Tinos-*.ttf" -delete
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "Arimo-*.ttf" -delete
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "Cousine-*.ttf" -delete

    # [fonts/apache/roboto, fonts/apache/robotocondensed] provided by community/ttf-roboto
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "Roboto-*.ttf" -delete
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "RobotoCondensed-*.ttf" -delete

    # [fonts/ofl/inconsolata] provided by community/ttf-inconsolata
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "Inconsolata-*.ttf" -delete

}
