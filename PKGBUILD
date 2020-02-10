# Maintainer: Fernando Vasquez <fmorataya.04@gmail.com>

_gitname=wpgtk
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=deviantfero # deviantfero
pkgver=r752.64b4523
pkgrel=1
pkgdesc="A gui wallpaper chooser that changes your Openbox theme, GTK theme and Tint2 theme"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPLv2')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}"
        "wpgtk.png::https://github.githubassets.com/images/icons/emoji/unicode/1f3b4.png")
noextract=('wpgtk.png')
sha512sums=('SKIP' 'SKIP')
arch=('any')
depends=('python' 'python-pillow' 'python-gobject' 'gtk3' 'libxslt' 'python-pywal')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper'
			'xsettingsd: live reload GTK+ theme')
conflicts=("${_gitname}")
provides=("${_gitname}=$pkgver")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_gitname/$_gitname/misc/wpg.conf" \
                 "usr/etc/$_gitname/wpg.conf"
  install -Dm644 "$srcdir/$_gitname/$_gitname/misc/wpgtk.desktop" \
                 "$pkgdir/usr/share/applications/wpgtk.desktop"
  install -Dm644 "$srcdir/wpgtk.png" \
                 "$pkgdir/usr/share/pixmaps/wpgtk.png"
  install -Dm644 "$srcdir/$_gitname/completions/bash/wpg" \
                 "usr/share/bash-completion/wpg"
  install -Dm644 "$srcdir/$_gitname/completions/zsh/_wpg" \
                 "usr/share/zsh/site-functions/_wpg"
  install -Dm644 "$srcdir/$_gitname/$_gitname/misc/wpg-install.sh" \
                 "usr/bin/wpg-install.sh"
}
