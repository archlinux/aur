# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Barry Smith <brrtsm at gmmal dot com>

pkgname="ntopng-bin"
# to update visit https://packages.ntop.org/apt/bullseye/x64/ and keep track of the latest pkgver, date and build
_pkgverAmd=5.7
_dateAmd=230507
_buildAmd=20289
# to update visit https://packages.ntop.org/apt/bullseye_pi/arm64/ and keep track of the latest pkgver, date and build
_pkgverArm=5.7
_dateArm=230507
_buildArm=20289
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
optdepends=("ntopng-data")
source=("ntopng.sysusers"
	    "ntopng.tmpfiles"
	    "ntopng@.service")
source_x86_64=("https://packages.ntop.org/apt/bullseye/x64/ntopng_${_pkgverAmd}.${_dateAmd}-${_buildAmd}_amd64.deb")
source_armv7h=("https://packages.ntop.org/apt/buster_pi/armhf/ntopng_${_pkgverArm}.${_dateArm}-${_buildArm}_armhf.deb")
source_aarch64=("https://packages.ntop.org/apt/bullseye_pi/arm64/ntopng_${_pkgverArm}.${_dateArm}-${_buildArm}_arm64.deb")
sha256sums=('58518c808ea300350e6aaa83fafb2320dfed85dd8615793bba3d5b6041edb1b5'
            '454688247e747d96b258f2e2317cdc29bfbf42b35bf03f10363182e8844cd50f'
            '034d4fa2a6616a6240edc74e278b96e45730e7acc12d60a7b4458b04906c127b')
sha256sums_x86_64=('ed48ad97be7f49fad2847d79062eb3c48fdcff208d3c40374fbd25c230d86d8d')
sha256sums_armv7h=('6c54d841d4ac9a4c07651be2b9ba98c9b97802936274129ad43d0456b436ea34')
sha256sums_aarch64=('5e7d2cc0bdfdb441802ba208b74869030d4316c4b7133b8b858a5da964669069')
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
