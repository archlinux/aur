# Maintainer: Matthias Gatto <uso.cosmo.ray at gmail dot com>

pkgname=sukeban-git
pkgver=r666.602304d
pkgrel=1
pkgdesc="FOSS JRPG about school and stuff, still heavilly in devlopement"


arch=('x86_64')

url='http://github.com/ArthurRobein/Pre-Hangover-Quest'

licence=(LGPL3)

pkgver() {
	 cd "${srcdir}/Pre-Hangover-Quest"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

depends=(yirl-git)

source=(git://github.com/ArthurRobein/Pre-Hangover-Quest.git)
sha256sums=("SKIP")

build() {
	 cd "${srcdir}/Pre-Hangover-Quest"
	 git submodule update --init --recursive
}

package() {
	 cd "${srcdir}/Pre-Hangover-Quest"
	 mkdir -p "$pkgdir/usr/share/sukeban"
	 cp -rv * "$pkgdir/usr/share/sukeban/"
	 mkdir -p "$pkgdir/usr/bin/"
	 echo "#!/bin/sh" > "$pkgdir/usr/bin/sukeban"
	 echo "yirl-loader --binary-root-path /usr/share/yirl/ -d /usr/share/sukeban/ -L" >> "$pkgdir/usr/bin/sukeban"
	 chmod +x "$pkgdir/usr/bin/sukeban"
	 mkdir -p "$pkgdir/usr/share/applications"
	 cp sukeban.desktop "$pkgdir/usr/share/applications/"
}
