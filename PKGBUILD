# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>
# Contributor: Max Gautier <mg+archlinux@max.gautier.name>
# Contributor: Artoria Pendragon <saber-nyan@ya.ru>
_pkgname=kernel-modules-hook
pkgname=${_pkgname}-bindmount
pkgver=0.2.3
pkgrel=1
pkgdesc="Keeps your system fully functional after a kernel upgrade"
arch=('any')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-hardlinks")
url="https://github.com/archlinux-jerry/pkgbuilds/tree/master/kernel-modules-hook-hardlinks"
license=('GPL3')
source=("linux-modules-cleanup.conf"
        "10-linux-modules-pre.hook"
        "61-linux-modules-post.hook"
        "linux-modules-restore"
        "linux-modules-save"
)
sha256sums=('950f851eba08dac4d0b93ff62b3fb16ddacd4f8ebb98a2435f80bf05f2ea5a29'
            'c3f75396f98caf9b13511290e29ce9d1d6827999ca49f0eca6c44a6702fd8d70'
            'fc4d53dec520c80fe97dfda65b238c7d678e7ef26aaebffc5b43f924477ea4f4'
            'a902b49c67df16ba69c246b589b89598dff3edd5fe9965c107140e4e7e98110a'
            'aa0ce16a6fc4c41e175557e6ce5f885244e8c48e4015bcbc5f04bb82f7442a9d')

package() {
	install -Dm644 'linux-modules-cleanup.conf' "${pkgdir}/usr/lib/tmpfiles.d/linux-modules-cleanup.conf"
	install -Dm644 10-linux-modules-pre.hook 61-linux-modules-post.hook -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm755 linux-modules-{save,restore} -t "${pkgdir}/usr/share/libalpm/scripts/"
}
