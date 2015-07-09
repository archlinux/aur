# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Sebastian Stammler <stammler.s@gmail.com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=ttf-google-fonts-git
pkgver=20150316
pkgrel=2
pkgdesc="TrueType fonts from the Google Fonts project"
arch=('any')
url="https://github.com/google/fonts"
license=('various')
# About why "cantarell-fonts" is a dependency see comment in package() function.
depends=('cantarell-fonts'
         'fontconfig'
         'xorg-fonts-encodings'
         'xorg-mkfontdir'
         'xorg-mkfontscale')
makedepends=('git')
conflicts=('adobe-source-code-pro-fonts'
           'adobe-source-sans-pro-fonts'
           'googlefontdirectory'
           'jsmath-fonts'
           'lohit-fonts'
           'oldstand-font'
           'openarch_fonts'
           'otf-bitter'
           'otf-goudy'
           'ttf-andika'
           'ttf-anonymous-pro'
           'ttf-cantarell'
           'ttf-cardo'
           'ttf-chromeos-fonts'
           'ttf-comfortaa'
           'ttf-droid'
           'ttf-fira-mono'
           'ttf-fira-sans'
           'ttf-google-fonts-hg'
           'ttf-google-webfonts-git'
           'ttf-google-webfonts-hg'
           'ttf-google-webfonts'
           'ttf-inconsolata'
           'ttf-kimberly_geswein_print'
           'ttf-lato'
           'ttf-lekton'
           'ttf-medievalsharp'
           'ttf-noto'
           'ttf-nova'
           'ttf-oldstandard'
           'ttf-opensans'
           'ttf-oxygen'
           'ttf-oxygen-git'
           'ttf-pt-mono'
           'ttf-pt-sans'
           'ttf-ptsans'
           'ttf-roboto'
           'ttf-roboto-mono'
           'ttf-sil-fonts'
           'ttf-sortsmillgoudy'
           'ttf-source-code-pro'
           'ttf-source-sans-pro'
           'ttf-ubuntu-font-family'
           'ttf-vollkorn')
provides=("${conflicts[@]}" 'ttf-font')
source=("git://github.com/google/fonts.git")
md5sums=('SKIP')
install=font.install

# git variables
_gitname="fonts"

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  find . -type f -name \*.ttf -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/fonts/TTF" \;

  # remove Cantarell fonts because Google ships the original Cantarell
  # instead of the improved version of Cantarell shipped by the GNOME Project
  #
  # it is safe to remove "Cantarell-*.ttf" from this dir because the
  # cantarell-fonts package installs its fonts into /usr/share/fonts/cantarell/
  # and because cantarell-fonts installs .otf files instead of .ttf files
  find "${pkgdir}/usr/share/fonts/TTF" -type f -name "Cantarell-*.ttf" -delete
}
