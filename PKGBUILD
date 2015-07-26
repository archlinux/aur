# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
# Contributor: Sebastian Stammler <stammler.s@gmail.com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

# This package is a version of ttf-google-fonts-git that makes opinionated
# exclusions for certain fonts in the Google repository that are outdated or
# otherwise unsuitable (bugs, etc.) Their individual packages are included as
# dependencies instead. A list of excluded fonts is below.

# Cantarell: Google ships an outdated version compared to the cantarell-fonts
# package.

# Droid: the ttf-droid package includes more variants.

# Fira Sans & Fira Mono: Google ships an outdated and buggy version.
# https://github.com/google/fonts/issues/10

# Inconsolata: Google ships a modified version.

pkgname=ttf-google-fonts-opinionated-git
pkgver=20150721
pkgrel=1
pkgdesc="TrueType fonts from the Google Fonts project"
arch=('any')
url="https://github.com/google/fonts"
license=('various')
depends=('fontconfig'
         'xorg-fonts-encodings'
         'xorg-mkfontdir'
         'xorg-mkfontscale'

         'cantarell-fonts'
         'ttf-droid'
         'ttf-fira-sans'
         'ttf-fira-mono'
         'ttf-inconsolata')
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
           'ttf-cardo'
           'ttf-chromeos-fonts'
           'ttf-comfortaa'
           'ttf-google-fonts-git'
           'ttf-google-fonts-hg'
           'ttf-google-webfonts'
           'ttf-google-webfonts-git'
           'ttf-google-webfonts-hg'
           'ttf-kimberly_geswein_print'
           'ttf-lato'
           'ttf-lekton'
           'ttf-medievalsharp'
           'ttf-nova'
           'ttf-noto'
           'ttf-oldstandard'
           'ttf-opensans'
           'ttf-oxygen'
           'ttf-oxygen-git'
           'ttf-ptsans'
           'ttf-pt-mono'
           'ttf-pt-sans'
           'ttf-roboto'
           'ttf-roboto-mono'
           'ttf-sil-fonts'
           'ttf-sortsmillgoudy'
           'ttf-source-code-pro'
           'ttf-source-sans-pro'
           'ttf-ubuntu-font-family'
           'ttf-vollkorn'
           'ttf-lato')
provides=("${conflicts[@]}" 'ttf-font')
source=("git://github.com/google/fonts.git")
md5sums=('SKIP')
install=ttf-google-fonts-opinionated-git.install

# xz compression is very slow for a large font package. Using gzip is much
# faster with only around ~50 megabytes in added size.
PKGEXT='.pkg.tar.gz'

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

  # Remove excluded fonts.
  find "${pkgdir}/usr/share/fonts/" -type f -name "Cantarell-*.ttf" -delete
  find "${pkgdir}/usr/share/fonts/" -type f -name "Droid*.ttf" -delete
  find "${pkgdir}/usr/share/fonts/" -type f -name "Fira*.ttf" -delete
  find "${pkgdir}/usr/share/fonts/" -type f -name "Inconsolata-*.ttf" -delete
}
