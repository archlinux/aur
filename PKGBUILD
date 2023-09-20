# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=huaweicloudmeeting
pkgver=8.11.1
pkgrel=1
pkgdesc="HuaWei Cloud Meeting"
arch=(x86_64 aarch64)
url="https://www.huaweicloud.com/product/meeting"
license=('custom')
depends=(bash electron20)
source=("https://softclient.meeting.huaweicloud.com/HUAWEICLOUDMeeting_DomesticOS.deb" # todo: this link has no version
        )
sha256sums=('73e0929fe6bc2b8b94c93f1b88bdce2e387ca289e5df00f80e0a9921c9ae0107')

package() {
	tar -xvf data.tar.* -C $pkgdir
	echo -e "#!/usr/bin/bash\nelectron20 /opt/华为云会议/resources/app %U" | install -vDm755 /dev/stdin $pkgdir/usr/bin/huaweicloudmeeting
  find $pkgdir -name "*.desktop" -print -exec sed -i -r 's/Exec=.*/Exec=huaweicloudmeeting/' {} \;
  find $pkgdir/opt -type f -not -path "*/resources/*" -print -delete 
}
