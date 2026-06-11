# Maintainer: Muhammad Rizal Nurromdhoni <mrizaln2000 at gmail dot com>
# AUR packager: Élie Leblanc <leblancelie.moi at gmail dot com>
pkgname=madbfs-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Mount Android phones on Linux with adb (userspace filesystem for Android via adb using FUSE)"
arch=(x86_64)
url="https://github.com/mrizaln/madbfs"
license=('MIT')
depends=(android-tools)
makedepends=(chrpath)
provides=(madbfs)
conflicts=(madbfs)
source=("$url/releases/download/v$pkgver/madbfs.tar.gz"
"https://raw.githubusercontent.com/mrizaln/madbfs/refs/heads/main/README.md")
sha256sums=('edbb40dd0c4f16edc26fe1141e44a3233238730937f16fb14bb1d7b4cbf4ae6f'
'8c415279df95517f4660721d7a667bda7fc6e8823c67792f34f6edc00092224a')

package(){
	chrpath -d "${srcdir}/madbfs/madbfs"
	echo -e "#!/bin/sh\n/usr/bin/madbfs-bin --no-cache \$@" > "${srcdir}/madbfs/madbfs-wrapper-script"
	install -Dm755 "${srcdir}/madbfs/madbfs" "${pkgdir}/usr/bin/madbfs-bin"
	install -Dm755 "${srcdir}/madbfs/madbfs-wrapper-script" "${pkgdir}/usr/bin/madbfs"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/madbfs-bin/MIT.txt"
	install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/madbfs/README.md"
}
