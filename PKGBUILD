# Maintainer: rany <rany at i2pmail dot org>

pkgname=popura-git
_pkgname="popura"
pkgver=0.3.15+popura1
_commit=42941caaf13472f1ecc0c675ae6059a857f3e60a
pkgrel=1
pkgdesc="Popura ポプラ: alternative Yggdrasil network client"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/popura-network/Popura"
license=('LGPLv3')
conflicts=('popura')
makedepends=('git' 'go')
source=("popura::git+https://github.com/popura-network/Popura.git#commit=${_commit}"
	'popura.sysusers'
        'popura-default-config.service'
        'popura.service')
sha512sums=('SKIP'
            'af276973744e079e6892d8ecdf2027ea265a05908f624f82da35d5bcc77a91ddeb458c4c3d07341aae42f003189201d3989cce5f87e184e472c1a23112cfe554'
            '449da220d0e7f502268adb302a2672315e37dc0a08a7923727eec6eb9f49fdc803ac0240508e62920edd826c6d294cec238485edebb5250228fa35eb20e544fb'
            'c6fbc97bb7c372e6d6094a6826fdc03306ed7ba67bb7303567ad5d650dee34eead803c03bcf39a6a836b149fafbef5462d756aae3c1099ddaba6eb7b446e3274')

build() {
	cd "${srcdir}/${_pkgname}"
	./build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "yggdrasil" "${pkgdir}/usr/bin/popura"
	install -Dm755 "yggdrasilctl" "${pkgdir}/usr/bin/popuractl"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm644 "${srcdir}/popura.sysusers" "${pkgdir}/usr/lib/sysusers.d/popura.conf"
        install -Dm644 "${srcdir}/popura.service" -t "${pkgdir}/usr/lib/systemd/system"
        install -Dm644 "${srcdir}/popura-default-config.service" -t "${pkgdir}/usr/lib/systemd/system"
}
