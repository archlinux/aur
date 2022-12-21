# Maintainer: zer0def <zer0def@freenode>
# Maintainer: Björn Wiedenmann <archlinux cat xorxor dog de>
# Contributor: Jonathan Yantis <yantis cat yantis dog net>
# Contributor: Christian Hesse <mail cat eworm dog de>
# Contributor: Gaetan Bisson <bisson cat archlinux dog org>
# Contributor: Caspar Verhey <caspar at verhey dot net>
# Contributor: Seth Fulton  <seth cat sysfu dog com>
# Contributor: Aaron Griffin <aaron cat archlinux dog org>
# Contributor: judd <jvinet cat zeroflux dog org>
# Contributor: benetnash <benetnash cat mail dog icpnet dog pl>
# Contributor: Thomas Haider <t.haider cat vcnc dog org>

# Note: The bulk of this PKGBUILD is based off:
# https://aur.archlinux.org/packages/op/openssh-git/PKGBUILD
# https://aur.archlinux.org/packages/op/openssh-hpn/PKGBUILD

# IMPORTANT SECURITY NOTE:
# This PKGBUILD does NOT (!!!) follow the upstream
# OpenSSH-Portable distribution (at
# https://github.com/openssh/openssh-portable ) but rather a
# fork which is maintained by rapier (primarily for Gentoo
# Linux I believe). The fork includes the HPN patches and can be
# found at https://github.com/rapier1/openssh-portable
#
# Since I do NOT maintain this fork in any way, but merely
# package it for Arch Linux, there is absolutely no warranty for
# this code. It is very possible that the current version of the
# fork still contains open security bugs which have already been
# fixed in upstream OpenSSH.
#
# USE THIS PKGBUILD AT YOUR OWN RISK AND ONLY IF YOU FULLY
# UNDERSTAND THE SECURITY IMPLICATIONS OF NOT USING THE MOST
# RECENT OFFICIAL OPENSSH !
#
# Consider yourself warned.
#
# If security is paramount for you or in case of any doubt,
# please use the official OpenSSH distribution instead.

# This package should probably follow chutzpah@gentoo's patches in the future

pkgbase=openssh-hpn
pkgname=(
  openssh-hpn
  openssh-hpn-shim
)
_openssh_ver=9.1p1
_hpn_ver=hpn17v10
#_pkgver="$(sed -e 's/\./_/' -e 's/p/_P/' <<< ${_openssh_ver})_new"
_pkgver="$(sed -e 's/\./_/' -e 's/p/_P/' <<< ${_openssh_ver})"
git_rev="hpn-${_pkgver}"
#git_rev="1fb7466a7a8c43e8b4ea4587ecb16d7b725a0d8e"  # 9.1p1-hpn17v7
pkgver="${_openssh_ver}.${_hpn_ver}"
pkgrel=1
pkgdesc='A Secure SHell server/client fork with High Performance patches included'
url='https://www.psc.edu/index.php/hpn-ssh/'
license=('custom:BSD')
arch=('x86_64' 'i486' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('krb5' 'ldns' 'libedit' 'openssl')
makedepends=('git' 'libfido2')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X'
            'libfido2: FIDO/U2F support')
conflicts=('openssh-hpn-git')
source=(
  "https://github.com/rapier1/openssh-portable/archive/${git_rev}.tar.gz"
  "hpn-revert-default-port-2222.patch"
  'http://www.eworm.de/download/linux/openssh-tests-scp.patch'
  #'openssl11.patch'
  #'hpn-banner.patch'
  'glibc-2.31.patch'
  #'hpn14v22-globals-cleanup.patch'
  'hpnsshdgenkeys.service'
  'hpnsshd.service'
  'sshdgenkeys.service'
  'sshd.service'

  'sshd.pam'
  'sshd.conf'
)

sha512sums=(
  'c0047d47570e3dde4b3531ca99d506d5d415fa608994875740d1e0b0f3a73237150b3a45de6c62071a2ea92e8915e80b73c340ecb20f14d098ccf9e95199bd51'
  'c13f8d8dbbf28e4edbe0c82822d5651f56ed2a683b2e9d12b541657e5b0ba002b6a4b60eb9a6067ac28295ef529f65a2a728e0d5974d87dc7fe76d1d5b946fc0'
  '62e2d60fdd39243e6245d90a0940b67ac4e72d042d8146203d50cdaa2df51611d91831d3b152d42302490afd677ae3433a3eba975dee68dbf7c06728167bb6d4'
  #'5d96a288ae925584cdcde0305c511b18e3cfaed6cae49f5fc6f062f62100d10a087144e8263380d19a14dca71c745065ddaa0062542c2e2cfa1db04811d40dc7'
  #'a9ee92fd135c47a27ac260ab40c057f0e35c118efcb281e98e235158ffd8599acede67dcce6da4c2589b2a0bd794c587af80d4ce4f85c1b9823cb9acfbbe9050'
  'aeee097dbf46aa22f411d78a49b9db7b2451dd0351bb5f57c7b3159c7ddc29aa994cd43046c187033c474f8fb2952165536197139eb7c495db99f6697f41637d'
  #'beaa201496c1c670f5fe1e99b88308fff16502ed5ac0d6dce3077be9ea44f6e30d5cd0946e5bf5f11c4b174f9afe372fa198c8ef278f5c5511aa2410d3441ec2'
  '6438c063d8785babb33e18ee082ea96168a56a4e02099b521015dfc764d3411b97d911e0cc577cdb9ac7a572e8cf0b86a9d4fa1e3c83166055690fa3f551dc7d'
  '3abe76d3ed971f4ef69013732f5be4cdfb8de0a12705b5d7190907a543c6d044bf064ff637f4511e4d95fbab58066ede8d0cce996d1adb1c2ec917be980f228a'
  '2eec0760fb680ea0c1967e1560b9b16579a0b6fa3b1b1579188ceb8b02ec12ecc5d763b51ca694f2392cdd6a468b212c58cac0541f92ae51f26f2f19988c315b'
  'aaa3f0e9ee686b7208ef94e373007a57e5f62020339399d6abbbeba276acedb1868d62c0401c901fd021f9287b263347b699c0d4b65f503fa57bafef5f4b8829'
  '298e47a21c337101974fa5237b3110aa3c7638b5fa53bd07661413236c8ed3212b431abaeffd875af6c9a72b4f8e1c8512e1e1960cbfff15bfee62b32d305fc3'
  '838252ca7bfa69797cba8e31340321ece06a58428b47002cb835678d8e29c6f23f6521269a2b5b17820860a56df308185bc651484db24327cc58191e5f83222a'
)

b2sums=(
  'a9eee5c2189ae4fb5b8cfc0f9f4022fdd6b2f42b3356e6cb7c0e947bd3240bb2a42b0e3f48df035034563d0625bb16ae410cb3fffa39976828347d0181fbe501'
  'cbfde6e66551722222ef3aaa38f9be9d3b256be23308e6aaf8f8bcbe7c79b67d7b91ff7a06cf5807182dbbfb9cda89130f9945cc5e1d9576580fed3a879f3e5b'
  '1e6c8d39052bdc268c584488341e260a2695d4b9afabca41919710bb34833dd580ff1813c01b8ba91f2629273c8101ce0ed3b2749dabce054137b4ef37b2a548'
  #'051b7c350333ce57a4a5e57ba0f693aed4491a241fd9e65cf2a861773571b44b8d4ffa06506a0c4a05399a46108ec05321e69f210637f32e25c76e683b224505'
  #'b46019363a19e2a0c397d66b6f1dc24d1c1219372b7fd699d92a9c382b24b02437b37cb12b3bba7e3ca97cfe98170ad21fff5871daf2070bc3d175fe0b31680b'
  'a6ff4e82a92e7dba08f0e6c14ad1d280ad2dbc1d5ebdc7dc70eaa1b7963ddd5d5491fdf4c83cde1bec183b335ed20edaf101ac8bdb3c0f480adc72d41251723b'
  #'74fc72fe0f028e7b495b2a96df26ef9fd76648f2701bbfc2b271f5b55968b82951f1b7232435c2bdf9e92b74a69f0d8cf804c8ef1be7f9c226896cb17ba57166'
  'e6c672505b37fe915a4dd2f5a1503b8be88a124aed22cc736cccbc88573b23eba36e7702136b009c6209c1079f4520e4ee1233fa8a2bbb82f2ea1d8be388ea1f'
  '211234dd60995873e00952c29fcb77ee6f1e9519fda5abce0b1f3a26193f580ad0c948482fcc66769abf55e347f95a6e4ba2dde98257e6ddb97b6a18550aff5b'
  'f3cd6d8bf7a0861f2c70de9cd52619bd6777b67943b3dd84eb9f87ab95734bbc653f68aa4b9ee5ab353524c5621d06016fd5af7ee42e21c81c89bb68d5d8cf1f'
  '0b2ec199c7d772d4cfa6db12a653963727b01efea764fe364bb9138c983c56d1a33cc5e002b7edfeff957118d162e0c53c8d1b038a2f643bca38821b0ee8c3f6'
  '557d015bca7008ce824111f235da67b7e0051a693aaab666e97b78e753ed7928b72274af03d7fde12033986b733d5f996faf2a4feb6ecf53f39accae31334930'
  '27571f728c3c10834a81652f3917188436474b588f8b047462e44b6c7a424f60d06ce8cb74839b691870177d7261592207d7f35d4ae6c79af87d6a7ea156d395'
)

b3sums=(
  '930a5fa7d9a91ff26f9148a08dad1268ab54188a171cfcfb66e3ad92b5303a83'
  '0c09e8a6b87c79b8d9669f0bbe7469e86a7543fc149c986d21d68347e14eb670'
  'db9e75e396c8f45aacb0e14003aabdcf29b812e468a5a40b371957ffe9c7f52f'
  #'145f9d17920d7b3b1ef935e3a735171ac9783cbd94ee47eec86f3fb96a6a34c6'
  #'86f8ba9e3469c86c2ced236240d9ba9a253d82b8b6732d8592db481d984de258'
  'f76459d09d1cfd92acc212ae1d4fee73b31ab795ff605c8717b3ee0a6fa9dcf9'
  #'bb4b93c1ffa13df6d5d5441646cd6acb49464d5512ee8f36a7bc0e6f5097edb4'
  'e19a65db3153fad5b7ce20d7316d7207c90303e15e54dc9ea0e1a8255c53b134'
  '7f766a97ab867f1f7c5c2fc2770c0d7c7831a6422dfbc89e47f69d4d786a233f'
  '55f5587e33dc8328f1c406224d6e61e479b7ec93a5b5bfc155af073d3e23f309'
  'f03929c8964f2df4f4768745322a4c53b4105c2452a5b92c4c6655cf022193a9'
  'f417610d7bdc942b79ee6fcc59c37e3d68ca09069a021e62a33fabe259dcc3af'
  '50ac93718a139e60fbda1cf54a531f0053f05f61f62f398573770da047babed7'
)

prepare() {
  cd "${srcdir}/openssh-portable-${git_rev}/"

  # fix building if scp is not installed on host
  if [ ! -x /usr/bin/scp ]; then
    patch -Np1 < ${srcdir}/openssh-tests-scp.patch
  fi
  # https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=371794f20c7eb2b88cae2619b6fa3444452aafb4
  #patch -Np1 < ${srcdir}/openssl11.patch

  # not needed anymore, HPN advertises itself properly through an in-place update on 2020-04-21
  #patch -Np1 < ${srcdir}/hpn-banner.patch

  patch -Np1 < ${srcdir}/glibc-2.31.patch

  # double define fixed upstream in 4afe5ad21dd5a9a01cda3007cdd0af5bbe6b608c for 8.3p1-hpn14v22 on 2020-09-24
  #patch -Np1 < ${srcdir}/hpn14v22-globals-cleanup.patch

  patch -Np1 < "${srcdir}/hpn-revert-default-port-2222.patch"

  autoreconf -fi
}

build() {
  cd "${srcdir}/openssh-portable-${git_rev}/"

  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/hpnssh \
    --sysconfdir=/etc \
    --disable-strip \
    --with-ldns \
    --with-libedit \
    --with-security-key-builtin \
    --with-ssl-engine \
    --with-pam \
    --with-privsep-user=nobody \
    --with-kerberos5=/usr \
    --with-xauth=/usr/bin/xauth \
    --with-mantype=man \
    --with-md5-passwords \
    --with-pid-dir=/run \
    --host="${CHOST}"
  make
}

#check() {
#  cd "${srcdir}/openssh-portable-${git_rev}/"
#
#  # Tests require openssh to be already installed system-wide,
#  # also connectivity tests will fail under makechrootpkg since
#  # it runs as nobody which has /bin/false as login shell.
#
#  if [[ -e /usr/bin/scp && ! -e /.arch-chroot ]]; then
#    make tests
#  fi
#}

package_openssh-hpn() {
  install="openssh-hpn.install"
  backup=(
    'etc/hpnssh/ssh_config'
    'etc/hpnssh/sshd_config'
    'etc/pam.d/hpnsshd'
  )
  cd "${srcdir}/openssh-portable-${git_rev}/"

  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -Dm644 ../hpnsshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/hpnsshdgenkeys.service
  install -Dm644 ../hpnsshd.service "${pkgdir}"/usr/lib/systemd/system/hpnsshd.service

  install -Dm644 ../sshd.conf "${pkgdir}"/var/lib/tmpfiles.d/hpnsshd.conf
  install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/hpnsshd

  install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/hpnfindssl.sh
  install -Dm755 contrib/hpnssh-copy-id "${pkgdir}"/usr/bin/hpnssh-copy-id
  install -Dm644 contrib/hpnssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/hpnssh-copy-id.1

  sed \
    -e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
    -e '/^#PrintMotd yes$/c PrintMotd no # pam does that' \
    -e '/^#UsePAM no$/c UsePAM yes' \
    -i "${pkgdir}"/etc/hpnssh/sshd_config
}

package_openssh-hpn-shim(){
  depends=('openssh-hpn')
  provides=('openssh')
  conflicts=('openssh' 'openssh-hpn-git')
  install="openssh-hpn-shim.install"
  backup=(
    'etc/ssh/ssh_config'
    'etc/ssh/sshd_config'
    'etc/pam.d/sshd'
  )

  cd "${srcdir}/openssh-portable-${git_rev}/"

  install -dm0755 "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man/man1"
  for i in scp sftp ssh ssh-add ssh-agent ssh-copy-id ssh-keygen ssh-keyscan; do
    pushd "${pkgdir}/usr/bin" &>/dev/null; ln -s "hpn${i}" "${i}"; popd &>/dev/null
    pushd "${pkgdir}/usr/share/man/man1" &>/dev/null; ln -s "hpn${i}.1.gz" "${i}.1.gz"; popd &>/dev/null
  done
  pushd "${pkgdir}/usr/bin" &>/dev/null; for i in findssl.sh sshd; do ln -s "hpn${i}" "${i}"; done; popd &>/dev/null
  pushd "${pkgdir}/usr/share/man/man1" &>/dev/null; ln -sf hpnssh.1.gz slogin.1.gz; popd &>/dev/null

  install -dm0755 "${pkgdir}/usr/lib/ssh" "${pkgdir}/usr/share/man/man8"
  for i in sftp-server ssh-keysign ssh-pkcs11-helper ssh-sk-helper; do
    pushd "${pkgdir}/usr/lib/ssh" &>/dev/null; ln -s "../hpnssh/hpn${i}" "${i}"; popd &>/dev/null
    pushd "${pkgdir}/usr/share/man/man8" &>/dev/null; ln -s "hpn${i}.8.gz" "${i}.8.gz"; popd &>/dev/null
  done
  pushd "${pkgdir}/usr/share/man/man8" &>/dev/null; ln -s "hpnsshd.8.gz" "sshd.8.gz"; popd &>/dev/null

  install -dm0755 "${pkgdir}/usr/share/man/man5" "${pkgdir}/etc/ssh"
  for i in moduli ssh_config sshd_config; do
    pushd "${pkgdir}/usr/share/man/man5" &>/dev/null; ln -s "hpn${i}.5.gz" "${i}.5.gz"; popd &>/dev/null

    # apparently configs need to exist in target package for pacman to not stomp
    # them, instead of following previous package's `backup` entry *on removal*
    pushd "${pkgdir}/etc/ssh" &>/dev/null; ln -s "../hpnssh/${i}" "${i}"; popd &>/dev/null
  done

  install -Dm644 ../sshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/sshdgenkeys.service
  install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
  install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd
}
