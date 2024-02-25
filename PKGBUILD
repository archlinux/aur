# Maintainer: littzhch <2371050115@qq.com>
_pkgname=ustcwakeup
pkgname=$_pkgname-git
pkgver=r27.72c3a12
pkgrel=2
epoch=
pkgdesc="将USTC教务系统中的课程表导出为WakeUp备份文件"
arch=('any')
url="https://github.com/littzhch/ustc-wakeup"
license=('custom:GLWTPL')
groups=()
depends=('python' 'python-requests' 'python-pillow')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+$url.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python -m py_compile *.py
	echo "#!/bin/sh
python /usr/share/$_pkgname/main.py \"\$@\"
" > ustcwakeup
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 -t "$pkgdir/usr/share/$_pkgname" *.py
	install -Dm644 -t "$pkgdir/usr/share/$_pkgname/__pycache__" __pycache__/*
	install -Dm755 -t "$pkgdir/usr/bin" ustcwakeup
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
