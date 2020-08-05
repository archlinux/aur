# Maintainer: Librewish <librewish@gmail.com>


pkgbase=performance-tweaks
_gitname=performance-tweaks
pkgname=(
    'performance-tweaks'
    )
pkgver=r14.db7f090
pkgrel=1
arch=('any')
_branch='master'
url="https://github.com/librewish/performance-tweaks"
license=('GPL')
makedepends=('git')
source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')

_install() {
    if [[ -d $srcdir/$_gitname/$1/etc ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/etc $pkgdir
    fi

    if [[ -d $srcdir/$_gitname/$1/usr ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/usr $pkgdir
    fi
    
    if [[ -d $srcdir/$_gitname/$1/skel ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/skel $pkgdir/etc
    fi

}

pkgver() {
	cd "$srcdir/performance-tweaks"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package_performance-tweaks() {
    pkgdesc='automatic tweaks for Improving performance while gaming and other tasks'
    depends=(
	'cpupower'
        'preload'
        'haveged'
        'irqbalance'
        'systemd-swap'
        'nohang-git'
	'ananicy-git'
	'hdparm'
	'x86_energy_perf_policy'
        )
    optdepends=(
        'timeshift-autosnap: for snapshots bfore pacman upgrade'
        'grub-btrfs: for grub entries to btrfs snapshots'
	'systemd-guest-user: for guest user support'
        )    
    install=performance-tweaks.install
    provides=('performance-tweaks')
    conflicts=('performance-tweaks' 'tlp')

    _install ''
}

