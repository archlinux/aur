# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
# Contributor: Artoria Pendragon <saber-nyan@ya.ru>
_pkgname=kernel-modules-hook
pkgname=${_pkgname}-hardlinks
pkgver=0.2.3
pkgrel=1
pkgdesc="Keeps your system fully functional after a kernel upgrade"
arch=('any')
provides=("$_pkgname")
url="https://github.com/VannTen/$_pkgname"
license=('GPL3')
source=("linux-modules-cleanup.conf"
        "10-linux-modules-pre.hook"
        "61-linux-modules-post.hook"
        "linux-modules-restore"
        "linux-modules-save"
)
sha256sums=('950f851eba08dac4d0b93ff62b3fb16ddacd4f8ebb98a2435f80bf05f2ea5a29'
            '087e5ed70b2fc512d814fbded9e873955b1da5b6bf1e31975174d704ad143156'
            'fc4d53dec520c80fe97dfda65b238c7d678e7ef26aaebffc5b43f924477ea4f4'
            'a902b49c67df16ba69c246b589b89598dff3edd5fe9965c107140e4e7e98110a'
            'af7df16af22dd759495518e6d28484ff656458e505f04cf5aacfc6d7d3935d82')

package() {
	install -Dm644 'linux-modules-cleanup.conf' "${pkgdir}/usr/lib/tmpfiles.d/linux-modules-cleanup.conf"
	install -Dm644 10-linux-modules-pre.hook 61-linux-modules-post.hook -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm755 linux-modules-{save,restore} -t "${pkgdir}/usr/share/libalpm/scripts/"
}
