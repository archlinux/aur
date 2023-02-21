# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
# Contributor: Artoria Pendragon <saber-nyan@ya.ru>
_pkgname=kernel-modules-hook
pkgname=${_pkgname}-hardlinks
pkgver=0.2.0
pkgrel=1
pkgdesc="Keeps your system fully functional after a kernel upgrade"
arch=('any')
provides=("$_pkgname")
url="https://github.com/VannTen/$_pkgname"
license=('GPL3')
source=("linux-modules-cleanup.conf"
        "10-linux-modules-post.hook"
        "10-linux-modules-pre.hook"
        "linux-modules-restore"
        "linux-modules-save"
)
sha256sums=('950f851eba08dac4d0b93ff62b3fb16ddacd4f8ebb98a2435f80bf05f2ea5a29'
            '0492722850f90066d33baf7896eb4625fd812890bdb03f025184c8b4bf0ef94f'
            '2b86a037a9a394f57279408745bf5b19542f26b0ad862fd514470cd145108c10'
            '7cf080b0d0d5a07ccb414ffb793525e554ca95447201f22b917f0be04ff48d2a'
            '3168ea6c2740dbde4229d718e44f6262f2d10aef529fb446cdb4f1778b8b6424')

package() {
	install -Dm644 'linux-modules-cleanup.conf' "${pkgdir}/usr/lib/tmpfiles.d/linux-modules-cleanup.conf"
	install -Dm644 10-linux-modules-{pre,post}.hook -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm755 linux-modules-{save,restore} -t "${pkgdir}/usr/share/libalpm/scripts/"
}
