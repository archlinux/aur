# Maintainer: Kai Ninomiya <kainino1@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Submitter: Veeti Paananen <veeti.paananen@rojekti.fi>
# Contributor: Sebastian Stammler <stammler.s@gmail.com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

# This package is a version of ttf-google-fonts-git that makes opinionated
# exclusions for certain fonts in the Google repository that are outdated or
# otherwise unsuitable (bugs, etc.) Their individual packages are included as
# dependencies instead. A list of excluded fonts is below.

# cantarell-fonts:
#   Google ships an outdated version compared to the cantarell-fonts package.
#   https://github.com/google/fonts/issues/112

# ttf-droid:
#   The ttf-droid package includes more variants.

# ttf-inconsolata:
#   Google ships a modified version.

# ttf-sil-padauk:
#   Has more variants than Google Fonts.

pkgname=ttf-google-fonts-opinionated-git
pkgver=20200602
pkgrel=1
pkgdesc="TrueType fonts from Google Fonts, but with updated versions of some fonts"
arch=('any')
url="https://github.com/google/fonts"
license=('various')
depends=('fontconfig'
         'xorg-fonts-encodings'
         'xorg-mkfontdir'
         'xorg-mkfontscale'
         # Fonts excluded from this package:
         'cantarell-fonts'
         'ttf-droid'
         'ttf-inconsolata'
         'ttf-sil-padauk'
         )
makedepends=('git')
conflicts=('adobe-source-code-pro-fonts'
           'adobe-source-sans-pro-fonts'
           'adobe-source-serif-pro-fonts'
           'googlefontdirectory'
           'jsmath-fonts'
           'lohit-fonts'
           'oldstand-font'
           'openarch_fonts'
           'otf-bitter'
           'otf-goudy'
           'ttf-anonymous-pro'
           'ttf-cardo'
           'ttf-chromeos-fonts'
           'ttf-comfortaa'
           'ttf-croscore'
           'ttf-fira-mono'
           'ttf-fira-sans'
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
           'ttf-sortsmillgoudy'
           'ttf-source-code-pro'
           'ttf-source-sans-pro'
           'ttf-ubuntu-font-family'
           'ttf-vollkorn'
           'ttf-lato'
           # ttf-sil-fonts packages
           'ttf-sil-harmattan'
           'ttf-sil-scheherazade'
           'ttf-sil-abyssinica'
           )
provides=("${conflicts[@]}" 'ttf-font')
source=("git+https://github.com/google/fonts.git")
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
  find "${pkgdir}/usr/share/fonts/" -type f -name "Inconsolata-*.ttf" -delete
  find "${pkgdir}/usr/share/fonts/" -type f -name "Ligconsolata-*.ttf" -delete
  find "${pkgdir}/usr/share/fonts/" -type f -name "Padauk-*.ttf" -delete
}
