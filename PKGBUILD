# Maintainer: Jakub Janeczko <jjaneczk@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
pkgname=ppp-eap-mschapv2
pkgver=2.4.7
pkgrel=1
pkgdesc="EAP-MSCHAPv2 patched daemon which implements the Point-to-Point Protocol for dial-up networking."
arch=(x86_64)
url="https://www.samba.org/ppp/"
license=('GPL' 'BSD')
depends=('glibc' 'libpcap' 'openssl')
makedepends=('unzip')
provides=("ppp=$pkgver")
conflicts=("ppp")
backup=(etc/ppp/{chap-secrets,pap-secrets,options,ip-up,ip-down,ip-down.d/00-dns.sh,ip-up.d/00-dns.sh,ipv6-up.d/00-iface-config.sh})
source=(https://download.samba.org/pub/ppp/ppp-$pkgver.tar.gz{,.asc}
        ppp-2.4.6-makefiles.patch
        options
        ip-up
        ip-down
        ip-up.d.dns.sh
        ip-down.d.dns.sh
        ipv6-up
        ipv6-down
        ipv6-up.d.iface-config.sh
        ppp.systemd
        CVE-2015-3310.patch
        CVE-2020-8597.patch
        ppp-build-fix.patch::"https://github.com/paulusmack/ppp/commit/50a2997b.patch"
        ppp-openssl.patch::https://github.com/paulusmack/ppp/commit/3c7b86229f7bd2600d74db14b1fe5b3896be3875.patch
        "https://w3logistics.com/images/eap-patch-omerzu.zip"
        LICENSE)
sha512sums=('e34ce24020af6a73e7a26c83c4f73a9c83fa455b7b363794dba27bf01f70368be06bff779777843949bd77f4bc9385d6ad455ea48bf8fff4e0d73cc8fef16ae2'
            'SKIP'
            'd36a23470a2b6217555f367c989ce6fdc09c2627d1f03cf5a12e29de6c5421ef6a697d6399128008138d19beb4a2ae6316e2bf0b3eefe3f23635dbbda5a063be'
            '86b13a9f02cc44c5ba16d404fdb54459fcda22fb5f4c4e12b2101e47e2650b62576d6315cd41f30f103ea61fb6f86b7aa2e7d40336f849f45061f7ad9c5119fe'
            'bdaaac792dd448ff31da6da2749d8c2f9c4e0311b1d4639de7c68038fcaa333cc28e25f5a6308de0ecb24b60b2e7284a811482df990da5f54d5581a746964f3c'
            '92f3a5e383f2c888938e891ba831042e7f8c026b0ddf5ce8c3523d06ac32fa81742e638a4c665975cbc79868b98806d92574ee2ee8e034e33b065a90ee3ab28b'
            '1636b2f8e3e0b0561aae9716e62c58cc7bee06aea0cdc163e64aba17da427810b7a12e4cea3d51b7a0b212fc2f4b7890f08d35d25165cd340b93241c9fe8842c'
            '7ab85cd977333e89c1d184619a52fa46492db04760c86a44843607c68efc577a1715d0d1f827d6855184af0d87b4b4b02cf7e7102c798516238a45a3c8aa26ad'
            '256941b220ad54119daf1c76237fecd0b2e9ede1d74b0950c45e373252ce20c1d4cd35a26b4d35f94ad2b7f49569fc9050c44731d672317994b562c750020326'
            '1b8dc6300f746607c0cce835e69ed444f24ba81874ba061b2b0377f0b9c1cb41a383d6845b364dfabb249a461422972ba5010bacf55c5f85f5eb0d3c0f4c71cd'
            '5b92a05bcf3ad4b7a88434546884e088069ce7c16a10c472589ca5ecc648f86ca02c2f608fb856ac6cb6ef14b508c2e0dec146c953128693bfb6c988f1963de8'
            'b9978c4038fb764a1bbe9dea92850673e14978450c0dcd7a1b0b24c4ebd515fcc4c5cc82cd4b97d826d483261e96945208b9fe97d6fea09a7a5c7910541db24c'
            '68b5f9a1b6724b0d1164a9317920f1c0dfc7a61201233febf9bdde2b3f9779dc874703d5b8464160dccaef6d19107c2b0b9257b6e9b029c5b980585ab8c078cc'
            '242915cfdeefd629287890876e233b83582b3e6094f0ad58c96027b4dc8275fa18809d68b4ff63e77ca444767ed2b4f376f5501ed4a9247a6bbb50970e9b342a'
            '3c17faf7e18f936115ea8669354859963f66e4247f02e282ee8e026942534a40511ed862fc43d9044dcf0b72d0fe03dc90ec02f7e09c804f9aecb39a9645435d'
            'fc012971a062456fa4e253f5b4a5e2ce56ae1852293d0245ecfd165ba162fa76ec2c28e1035dd89de3e9d43941d528e2d95a40552eb8037a5ba084c1717c20d1'
            '26703d9ba168227607cac9c4d8ca4f064843145399cc59f56a7ea8adc272d74ff75c632fb75d8ccf38d6c212839eed94e589b422f9d3252d60bc212f1a0bc037'
            'ab3acd0387a7966ac3d220f2b0b6880302f827125d978991f83dd3f1a30340c2a98ca5aedf0b81ec6a9e5eb49b0b0a0a5356419f3b8415c892c2df8b52d3994a')
validpgpkeys=('631E179E370CD727A7F2A33A9E4295D605F66CE9') # Paul Mackerras (Signing key) <paulus@samba.org>

prepare() {
  cd ppp-$pkgver

  patch -p1 -i "$srcdir"/ppp-2.4.6-makefiles.patch
  patch -p1 -i "$srcdir"/CVE-2015-3310.patch
  patch -p1 -i "$srcdir"/CVE-2020-8597.patch
  patch -p1 -i "$srcdir"/ppp-build-fix.patch
  patch -p1 -i "$srcdir"/ppp-openssl.patch

  unzip -f "$srcdir/eap-patch-omerzu.zip"
  patch -p1 -i "$srcdir/eap-patch-omerzu/eap-patch-omerzu.diff"

  # enable active filter
  sed -i "s:^#FILTER=y:FILTER=y:" pppd/Makefile.linux
  # enable ipv6 support
  sed -i "s:^#HAVE_INET6=y:HAVE_INET6=y:" pppd/Makefile.linux
  # Enable Microsoft proprietary Callback Control Protocol
  sed -i "s:^#CBCP=y:CBCP=y:" pppd/Makefile.linux

  # try MSCHAPv2
  sed -i "s:eap_send_nak(esp, id, EAPT_SRP);:eap_send_nak(esp, id, EAPT_MSCHAPV2);:" pppd/eap.c
}

build() {
  cd ppp-$pkgver

  # -D_GNU_SOURCE is needed for IPv6 to work apparently
  CFLAGS="$CPPFLAGS $CFLAGS -D_GNU_SOURCE" LDFLAGS="$LDFLAGS" ./configure --prefix=/usr
  make
}

package() {
  cd ppp-$pkgver
  make INSTROOT="$pkgdir" install

  install -D -m644 ../options "$pkgdir"/etc/ppp/options
  install -D -m755 ../ip-up   "$pkgdir"/etc/ppp/ip-up
  install -D -m755 ../ip-down "$pkgdir"/etc/ppp/ip-down
  install -d -m755 "$pkgdir"/etc/ppp/ip-up.d
  install -d -m755 "$pkgdir"/etc/ppp/ip-down.d
  install -m755 ../ip-up.d.dns.sh   "$pkgdir"/etc/ppp/ip-up.d/00-dns.sh
  install -m755 ../ip-down.d.dns.sh "$pkgdir"/etc/ppp/ip-down.d/00-dns.sh
  install -D -m755 ../ipv6-up   "$pkgdir"/etc/ppp/ipv6-up
  install -D -m755 ../ipv6-down "$pkgdir"/etc/ppp/ipv6-down
  install -d -m755 "$pkgdir"/etc/ppp/ipv6-up.d
  install -d -m755 "$pkgdir"/etc/ppp/ipv6-down.d
  install -m755 ../ipv6-up.d.iface-config.sh "$pkgdir"/etc/ppp/ipv6-up.d/00-iface-config.sh

  install -D -m755 scripts/pon  "$pkgdir"/usr/bin/pon
  install -D -m755 scripts/poff "$pkgdir"/usr/bin/poff
  install -D -m755 scripts/plog "$pkgdir"/usr/bin/plog
  install -D -m644 scripts/pon.1 "$pkgdir"/usr/share/man/man1/pon.1
  install -D -m600 etc.ppp/pap-secrets  "$pkgdir"/etc/ppp/pap-secrets
  install -D -m600 etc.ppp/chap-secrets "$pkgdir"/etc/ppp/chap-secrets
  install -d -m755 "$pkgdir"/etc/ppp/peers
  chmod 0755 "$pkgdir"/usr/lib/pppd/$pkgver/*.so

  install -D -m644 "$srcdir"/ppp.systemd "$pkgdir"/usr/lib/systemd/system/ppp@.service

  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/ppp/LICENSE
}
