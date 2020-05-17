# Maintainer: Jimmy Stelzer jimmy.stelzer@gmail.com

pkgname=btusb-csr-0x8891
pkgver=5.6.13.zen1
pkgrel=1
pkgdesc="patch btusb so it works on CSR clone devices with id 0x8891"
url=https://bugzilla.kernel.org/show_bug.cgi?id=60824
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux-headers')

source=("Makefile"
	"btusb.patch"
	"btusb-csr.install"
	"btusb.c::https://github.com/zen-kernel/zen-kernel/blob/v5.6.13-zen1/drivers/bluetooth/bfusb.c"
	"btintel.h::https://github.com/zen-kernel/zen-kernel/blob/v5.6.13-zen1/drivers/bluetooth/btintel.h"
	"btbcm.h::https://github.com/zen-kernel/zen-kernel/blob/v5.6.13-zen1/drivers/bluetooth/btbcm.h"
	"btrtl.h::https://github.com/zen-kernel/zen-kernel/blob/v5.6.13-zen1/drivers/bluetooth/btrtl.h")

sha512sums=('b2ae4e73cae88376ada4cdf3cd0edcedc6c5a2b13f3a9cf1edd65b0c3a97705302a08ca8e189fe7c07ea077223b3ca3f9afa8c051ac2f1f824e450dabb413f06'
         'b743173b2466a88502fd59920fc88cf1a1fa64ffe21d6821afdad569570161ee2c6b17888cf98f6e04ae0542ead02f0a29cc1b59f93dbce0c794b61ae60740ab'
         '8c13b46a9da98852ddbced9005ea911a1347a1db493c8f6eac08491d3e25d277c97135bcb1941fbd795eb899a406e07d857c3db8b52c70fb92d2093196e15c1b'
         'ff192171996c031b1bc03263173a9d78c425d4263ca3100b448bead71c8f67c74ca53add0e3d083a52409a91a17e6676025ff940fe252eb6ed1ba80c2300c04f'
         '16ce8e77b598ca4dc5dbba805046e066698a5157fee73b0425a4bd51e1b063a745a3aa3cc169abcacb249d3bd93901a059f3a71dc009f3ca93af2e542400a35b'
         'b526d42413a1621bbd6360ada6e0623c74c7cb31c0e82d1ac6690b782ea2c9b496bb6e650fe4a66fa16bb405ecb3f14233f7c3e68093f9939a21f61c2f082ea0'
         '3458820f64b426444406356c56d1845c6e077d829fa2cdb6804befda657b7ae495d39da11b6ba6202fb147a64e161e74a48fcb6d7a7ef19bc122da12c7c47ebf')

install="btusb-csr.install"

prepare() {
	\cp --remove-destination $(readlink btusb.c) btusb.c
	patch -p1 < btusb.patch
}

build() {
	make
}

package() {
	install -Dm644 btusb.ko "$pkgdir/usr/lib/modules/$(uname -r)/updates/btusb.ko"
}

