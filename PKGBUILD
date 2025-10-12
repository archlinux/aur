# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Barry Smith <brrtsm at gmmal dot com>
# Contributor: TheDL98 <ahmed at thedl98 dot com>

pkgname="ntopng-bin"
# to update visit https://packages.ntop.org/apt/trixie/x64/ and keep track of the latest pkgver, date and build
_pkgverAmd64=6.5
_dateAmd64=251012
_buildAmd64=26736
# to update visit https://packages.ntop.org/apt/bookworm_pi/arm64/ and keep track of the latest pkgver, date and build
_pkgverArm64=6.5
_dateArm64=251012
_buildArm64=26736
# to update visit https://packages.ntop.org/apt/buster_pi/armhf/ and keep track of the latest pkgver, date and build
_pkgverArm32=6.1
_dateArm32=240707
_buildArm32=23727
# updated automatically
pkgver="$_pkgverAmd64.$_dateAmd64"
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
source_x86_64=("https://packages.ntop.org/apt/trixie/x64/ntopng_${_pkgverAmd64}.${_dateAmd64}-${_buildAmd64}_amd64.deb")
source_aarch64=("https://packages.ntop.org/apt/bookworm_pi/arm64/ntopng_${_pkgverArm64}.${_dateArm64}-${_buildArm64}_arm64.deb")
source_armv7h=("https://packages.ntop.org/apt/buster_pi/armhf/ntopng_${_pkgverArm32}.${_dateArm32}-${_buildArm32}_armhf.deb")
b2sums=('c0ba0afb3fdeedaf57f54ce405cd5ce688bb5ed19d05cc21fbefca7ecda98bc5df2cf603e7ac92108763dc26c1ef391afdf69116bb13c03f8e2d3e75fe6bbda5'
        'ca912cbe9e43a5be67e2b487183e43615b93497a62515cad7b1468fab5e3dc9a2dc3fd2e8d88c12d54c91cb3b8c61ebe682c1e7dc5f3ea49aaf0d87aa2a9bbd1'
        'e374ff823b8218faf86c56e0794622954b09b41f5c893db08d3ad38ea1d4fe47733095853d1bf11041b1e4b476d01c1a1a495af40221d6e4e30a0ac223684fac')
b2sums_x86_64=('905beb1569a4b1100ec2f552afc88ca6c62c738fc2dac68047e9271e82a1d41c9995bbc7a12247fc520054bd0d5435bb6ad3d1de49b9bb84b7ece6e82f27bd53')
b2sums_armv7h=('f2996f73459a37fe6cdf31d91d96f6bb7154133093c1202eee688aa58345b873db8ee00944955648a1994341b8619c6900f0b709d878517c9b92a466a961144a')
b2sums_aarch64=('ece3bd5d4830170ab26249aae8fa02af644d6df104badd8aad2dbeb5b3b8591970d6195aeeca5e09425f7ec770109cb18a53213870af374dee14c3a5d907b27b')
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
