
# Maintainer: Sven Wick <sven.wick@gmx.de>

pkgname=ssh-tools
pkgver=1.4
pkgrel=1
pkgdesc="collection of various tools using ssh"
arch=("any")
url="https://github.com/vaporup/ssh-tools/"
license=("GPL")
depends=("openssh")
optdepends=("colordiff: colors for ssh-diff")
makedepends=("help2man")
changelog=
source=("https://github.com/vaporup/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("0cf8eb854944f0fa5b6635268d52c9cb")

build() {
	cd "$pkgname-$pkgver"

        mkdir -p "man"

        help2man -n "check if host is reachable using ssh_config"           -S SSH-TOOLS -N --version-string " " -o man/ssh-ping.1        ./ssh-ping
        help2man -n "shows version of the SSH server you are connecting to" -S SSH-TOOLS -N --version-string " " -o man/ssh-version.1     ./ssh-version
        help2man -n "diff a file over SSH"                                  -S SSH-TOOLS -N --version-string " " -o man/ssh-diff.1        ./ssh-diff
        help2man -n "get some facts about the remote system"                -S SSH-TOOLS -N --version-string " " -o man/ssh-facts.1       ./ssh-facts

}

package() {
	cd "$pkgname-$pkgver"

        mkdir -p $pkgdir/usr/share/man/man1/
	cp man/* $pkgdir/usr/share/man/man1/

        mkdir -p $pkgdir/usr/bin/
	cp ssh-* $pkgdir/usr/bin/
}

