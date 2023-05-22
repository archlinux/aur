# Maintainer: raven2cz <tonda.fischer@gmail.com>
# Contributor: limkokhole <limkokhole@gmail.com>

pkgname=pinterest-downloader-git
pkgver=e6a2816.20221120.155
pkgrel=1
pkgdesc="Download all images/videos from Pinterest user/board/section."
url="https://github.com/limkokhole/pinterest-downloader"
replaces=()
arch=("any")
license=("MIT")
depends=(
	"python-colorama"
	"python-lxml"
	"python-requests"
	"python-termcolor"
	"python-pysocks"
    "python-fake-useragent"
    "python-brotli"
)
makedepends=("git")
provides=()
conflicts=()
source=("git+$url.git")
sha256sums=("SKIP")

_repo_name=pinterest-downloader

pkgver() {
  cd "$srcdir/$_repo_name"
  _author_ver=$(git describe --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  _last_commit_date=$(git log -1 --pretty='%cd' --date=short | tr -d '-')
  _commit_count="$(git rev-list --count HEAD)"
  echo $_author_ver.$_last_commit_date.$_commit_count
}

package() {
  cd "$srcdir/$_repo_name"

  install -d -m755 "$pkgdir/usr/local/opt/$_repo_name"
  install -D -m755 "$srcdir/$_repo_name/$_repo_name.py" "$pkgdir/usr/local/opt/$_repo_name/$_repo_name.py"
  install -D -m644 "$srcdir/$_repo_name/LICENSE" "$pkgdir/usr/local/opt/$_repo_name/LICENSE"
	
  mkdir -p "$pkgdir/usr/local/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

  ln -s "/usr/local/opt/$_repo_name/$_repo_name.py" "${pkgdir}/usr/local/bin/$_repo_name.py"
  ln -s "/usr/local/opt/$_repo_name/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

