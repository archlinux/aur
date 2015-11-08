pkgname=monaco-powerline-font-git
pkgver=r16.616d338
pkgrel=1
pkgdesc="Monaco Powerline fonts for X11 and the console"
arch=('any')
url=('https://gist.github.com/arkhan/229a0729ec79c6fcec81')
license=('CPL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
install=$pkgname.install
_gitroot=('https://gist.github.com/229a0729ec79c6fcec81.git')
_gitname=monaco-powerline-font


build() {
    cd "$srcdir"
    msg2 "Connecting to github.com GIT server...."
    if [ -d "$srcdir/$_gitname" ] ; then
        cd "$_gitname" && git pull origin || return 1
        msg2 "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname" || return 1
        cd "$_gitname"
    fi
}

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"

  cd $srcdir/$_gitname
  find . -iname "*.otf" -exec install -m644 {} $pkgdir/usr/share/fonts/OTF \;
}
