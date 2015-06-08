# Maintainer: Andrea Girotto echo "naqern.tvebggb@tznvy.pbz" | tr '[a-z]' '[n-za-m]'
pkgname=ttf-monaco-ide-font-git
pkgver=r32.6e16811
pkgrel=1
pkgdesc="Monaco IDE fonts for X11"
arch=('any')
url=('https://github.com/cstrap/monaco-font.git')
license=('CPL')
#replaces=('monaco_linux' 'monaco-linux-font')
conflicts=('monaco_linux' 'monaco-linux-font', 'ttf-monaco')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
install=$pkgname.install

_gitroot=('https://github.com/cstrap/monaco-font.git')
_gitname=monaco-font-ide


build() {
    cd "$srcdir"
    msg2 "Connecting to github.com GIT server...."
    if [ -d "$srcdir/$_gitname" ] ; then
        cd "$_gitname" && git pull origin || return 1
        msg2 "The local files are updated."
    else
        echo git clone "$_gitroot" "$_gitname" 
        git clone "$_gitroot" "$_gitname" || return 1
        cd "$_gitname"
        git checkout monaco-font-ide
    fi
}

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 "$_gitname/Monaco_Linux.ttf" "$pkgdir/usr/share/fonts/TTF/Monaco_Linux.ttf"
}
