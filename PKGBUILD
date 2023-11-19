# Maintainer: Souptik Datta <root@souptik.dev>
pkgname='work-sess-manager'
pkgver=r23.3d9f8f9
pkgrel=1
pkgdesc="The all in one work session manager you need!"
arch=('x86_64')
url="https://github.com/Souptik2001/work-sess-manager"
license=('GPL')
depends=('lolcat' 'timer-bin')
makedepends=('git')
source=('work-sess-manager::git+https://github.com/Souptik2001/work-sess-manager.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
	cd "$pkgname"
	install -Dm755 ./sess.sh "$pkgdir/usr/bin/sess"
	# Might be a hacky way. I don't know how to build a bash file. Please help!
	find ./sess_includes -type f -exec install -Dm 755 "{}" "$pkgdir/usr/bin/{}" \;
}
