# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=sync-my-moodle-git
pkgver=r149.2f3bccf
pkgrel=1
pkgdesc="a synchronization client for the RWTH Moodle"
arch=('any')
url="https://github.com/Romern/syncMyMoodle"
license=('GPL3')
depends=('python>=3.6' 'python-requests' 'python-beautifulsoup4' 'youtube-dl' 'python-tqdm' 'python-pdfkit')
optdepends=('python-secretstorage')
makedepends=('git')
source=("$pkgname::git+https://github.com/Romern/syncMyMoodle.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
	sed -i 's/, default="config.json"/, default=os.path.expanduser("~\/.config\/sync-my-moodle.json")/g' "$srcdir/$pkgname/syncMyMoodle.py"
}

package()
{
	install -Dm 755 "$srcdir/$pkgname/syncMyMoodle.py" "$pkgdir/usr/bin/syncmymoodle"
}
