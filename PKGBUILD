_pkgname=gedit-source-code-browser
pkgname=$_pkgname-git
_pluginname=sourcecodebrowser
pkgver=r21.71ed19f
pkgrel=1
pkgdesc="A source code class and function browser plugin for Gedit 3."
arch=("any")
url="https://github.com/ywwg/$_pkgname"
depends=("gedit")
source=("git+$url.git")
sha256sums=('SKIP')
license=("BSD")
provides=( "$_pkgname" )
conflicts=( "$_pkgname" )
_plugindir="/usr/lib/gedit/plugins/"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/$_plugindir"
  cp -r $_pluginname "$pkgdir/$_plugindir"
  install -Dm644 $_pluginname.plugin "$pkgdir/$_plugindir"
  install -Dm644 README.markdown "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
