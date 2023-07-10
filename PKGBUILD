# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Barry Smith <brrtsm at gmmal dot com>

pkgname="ntopng-bin"
# to update visit https://packages.ntop.org/apt/bullseye/x64/ and keep track of the latest pkgver, date and build
_pkgverAmd=5.7
_dateAmd=230710
_buildAmd=20946
# to update visit https://packages.ntop.org/apt/bullseye_pi/arm64/ and keep track of the latest pkgver, date and build
_pkgverArm=5.7
_dateArm=230709
_buildArm=20934
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="https://www.ntop.org/"
license=("GPL3")
arch=("x86_64" "armv7h" "aarch64")
provides=("ntopng")
conflicts=("ntopng" "ntopng-git")
depends=("hiredis"
         "libcap"
         "libmariadbclient"
         "libmaxminddb"
         "rrdtool"
         "sqlite"
         "zeromq")
#optdepends=("ntopng-data")
source=("ntopng.sysusers"
	    "ntopng.tmpfiles"
	    "ntopng@.service")
source_x86_64=("https://packages.ntop.org/apt/bullseye/x64/ntopng_${_pkgverAmd}.${_dateAmd}-${_buildAmd}_amd64.deb")
source_armv7h=("https://packages.ntop.org/apt/buster_pi/armhf/ntopng_${_pkgverArm}.${_dateArm}-${_buildArm}_armhf.deb")
source_aarch64=("https://packages.ntop.org/apt/bullseye_pi/arm64/ntopng_${_pkgverArm}.${_dateArm}-${_buildArm}_arm64.deb")
sha256sums=('58518c808ea300350e6aaa83fafb2320dfed85dd8615793bba3d5b6041edb1b5'
            '454688247e747d96b258f2e2317cdc29bfbf42b35bf03f10363182e8844cd50f'
            '034d4fa2a6616a6240edc74e278b96e45730e7acc12d60a7b4458b04906c127b')
sha256sums_x86_64=('62f4d15b35207d5e90589512e0c9aa6a798a9c693fda7a61d6a5bc9f12c4459b')
sha256sums_armv7h=('85d5f214bef478f332d987d3f10ddbd0102705027ab65e87eb4677e46c983570')
sha256sums_aarch64=('9f06da66a8582ba5902ae31a2e92fb6c31c062c74b4547929b9f60624ec23fae')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
 # systemd files
 install -D -m 644 "ntopng.sysusers" "$pkgdir/usr/lib/sysusers.d/ntopng.conf"
 install -D -m 644 "ntopng.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ntopng.conf"
 install -D -m 644 "ntopng@.service" "$pkgdir/usr/lib/systemd/system/ntopng@.service"
}
