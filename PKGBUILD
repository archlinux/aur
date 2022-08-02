    # Maintainer: shadichy <shadichy.dev@gmail.com>
    pkgbase=systemback
    pkgname=("${pkgbase}-efiboot-amd64")
    pkgver=1.8.9
    pkgrel=2
    pkgdesc='Systemback EFI bootloader support'
    arch=('x86_64')
    url='https://github.com/shadichy/systemback-archlinux'
    license=('GPL')
    depends=('syslinux' 'libsystemback')
    makedepends=('ncurses' 'qt5-tools' 'make' 'gcc11' 'dpkg' 'debhelper' 'util-linux' 'util-linux-libs' 'qt5-base>=5.5.0' 'gcc-libs' 'procps-ng')
    source=(systemback-archlinux::git+https://github.com/shadichy/systemback-archlinux.git)
    md5sums=('SKIP')

    build() {
        cd "${srcdir}/${pkgbase}-archlinux/${pkgbase}"
        dpkg-buildpackage -d -us -uc
    }

    package() {
        dpkg-deb -xv "${srcdir}/${pkgbase}-archlinux/${pkgbase}-efiboot-amd64_${pkgver}_all.deb" "${srcdir}/${pkgbase}-archlinux/${pkgbase}-efiboot-amd64"
        cp -dr --no-preserve=ownership "${srcdir}/${pkgbase}-archlinux/${pkgbase}-efiboot-amd64/usr" "${pkgdir}/usr"
        install -dm755 "${pkgdir}/usr"
    }
