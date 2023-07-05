# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
# Contributor: Artoria Pendragon <saber-nyan@ya.ru>
_pkgname=kernel-modules-hook
pkgname=${_pkgname}-hardlinks
pkgver=0.2.4
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
            'fc4d53dec520c80fe97dfda65b238c7d678e7ef26aaebffc5b43f924477ea4f4'
            '087e5ed70b2fc512d814fbded9e873955b1da5b6bf1e31975174d704ad143156'
            '28b995f6ea62899620d43d71e542bfc3432ad3ce90a6582f4ded1173fe8c0837'
            '76a1e6890983948d11170adfcd746bf73f68a40f3b4ae6142532724161f6ae98')

package() {
	install -Dm644 'linux-modules-cleanup.conf' "${pkgdir}/usr/lib/tmpfiles.d/linux-modules-cleanup.conf"
	install -Dm644 10-linux-modules-{pre,post}.hook -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm755 linux-modules-{save,restore} -t "${pkgdir}/usr/share/libalpm/scripts/"
}
