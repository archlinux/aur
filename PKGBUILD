# Maintainer: faith <valters.tomsons@protonmail.com>
pkgname=yuzu-mainline-git-bin
pkgver=0.0.1
pkgrel=1
pkgdesc='Open-source emulator for Nintendo Switch (git)'
arch=('x86_64')
url='https://github.com/yuzu-emu/yuzu-mainline'
license=('GPL2')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu' 'yuzu-cmd')
depends=('sdl2' 'gpm' 'zip' 'openssl' 'zstd' 'sndio')
options=(!strip)

prepare()
{
	cd "$srcdir"
	curl -s https://api.github.com/repos/yuzu-emu/yuzu-mainline/releases/latest | grep "/yuzu-linux.*.tar.xz" | cut -d : -f 2,3 | tr -d \" | wget -O yuzu-linux.tar.xz -qi -
}

package()
{
        cd "$srcdir"
        tar -xf yuzu-linux.tar.xz --strip 1
        install -Dm755 "$srcdir/yuzu" "$pkgdir/usr/bin/yuzu"
        install -Dm755 "$srcdir/yuzu-cmd" "$pkgdir/usr/bin/yuzu-cmd"
}
