# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Morten Linderud <morten@linderud.pw> 
pkgname=nerd-fonts-git
pkgver=3.0.0.r30.g58504d670
pkgrel=1
epoch=1
pkgdesc="Iconic font aggregator, collection, and patcher: 34 patched fonts (77k variations). Includes popular glyph collections such as Font Awesome & fonts such as Hack"
_gitname=nerd-fonts
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
conflicts=('nerd-fonts' 'ttf-iosevka-nerd')
makedepends=('git' 'fontconfig' 'xorg-mkfontscale' 'xorg-bdftopcf' 'xorg-font-util')
conflicts=(
    'nerd-fonts'
    'nerd-fonts-complete'
    'nerd-fonts-complete-mono-glyphs'
    'nerd-fonts-anonymous-pro'
    'nerd-fonts-arimo'
    'nerd-fonts-bitstream-vera-mono'
    'nerd-fonts-cascadia-code'
    'nerd-fonts-dejavu-complete'
    'nerd-fonts-droid-sans-mono'
    'nerd-fonts-fantasque-sans-mono'
    'nerd-fonts-fira-code'
    'nerd-fonts-fira-mono'
    'nerd-fonts-go-mono'
    'nerd-fonts-hack'
    'nerd-fonts-hermit'
    'nerd-fonts-ibm-plex-mono'
    'nerd-fonts-inconsolata'
    'nerd-fonts-inconsolata-go'
    'nerd-fonts-iosevka'
    'nerd-fonts-liberation-mono'
    'nerd-fonts-noto'
    'nerd-fonts-noto-sans-mono'
    'nerd-fonts-noto-sans-regular-complete'
    'nerd-fonts-meslo'
    'nerd-fonts-monoid'
    'nerd-fonts-mononoki'
    'nerd-fonts-mplus'
    'nerd-fonts-profont'
    'nerd-fonts-roboto-mono'
    'nerd-fonts-source-code-pro'
    'nerd-fonts-terminus'
    'nerd-fonts-ubuntu-mono'
    'nerd-fonts-victor-mono'
    'otf-nerd-fonts-fira-code'
    'ttf-nerd-fonts-hack-complete-git'
    'ttf-iosevka-nerd')
provides=('nerd-fonts')
source=('git+https://github.com/ryanoasis/nerd-fonts.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-47
}

package() {

 # Prepare destination directories
  libdir="${pkgdir}/usr/lib/${pkgname}"
  otfdir="${pkgdir}/usr/share/fonts/${pkgname}/OTF"
  ttfdir="${pkgdir}/usr/share/fonts/${pkgname}/TTF"

  install -dm755 "${libdir}"
  install -dm755 "${otfdir}"
  install -dm755 "${ttfdir}"

  # Install fonts
  find "${srcdir}/${_gitname}/patched-fonts" -iname "*.ttf" -execdir install -m644 {} "${ttfdir}/{}" \;
  find "${srcdir}/${_gitname}/patched-fonts" -iname "*.otf" -execdir install -m644 {} "${otfdir}/{}" \;

  # Install scripts
  find "${srcdir}/${_gitname}/bin/scripts/lib" -iname "*.sh" -execdir install -m644 {} "${libdir}/{}" \;

  # Install license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


