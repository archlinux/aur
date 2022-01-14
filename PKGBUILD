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

pkgname=openssh-hpn
_openssh_ver=8.8p1
_hpn_ver=hpn15v5
#_pkgver="`sed -e 's/\./_/' -e 's/p/_P/' <<< ${_openssh_ver}`_new"
_pkgver="`sed -e 's/\./_/' -e 's/p/_P/' <<< ${_openssh_ver}`"
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
provides=('openssh')
conflicts=('openssh' 'openssh-hpn-git')
source=(
  "https://github.com/rapier1/openssh-portable/archive/hpn-${_pkgver}.tar.gz"
  'http://www.eworm.de/download/linux/openssh-tests-scp.patch'
  #'openssl11.patch'
  #'hpn-banner.patch'
  'glibc-2.31.patch'
  #'hpn14v22-globals-cleanup.patch'
  'sshdgenkeys.service'
  'sshd@.service'
  'sshd.service'
  'sshd.socket'
  'sshd.pam')
backup=('etc/ssh/ssh_config'
        'etc/ssh/sshd_config'
        'etc/pam.d/sshd')

sha512sums=(
  'aac8c71ed3f02c7b5bf22d5aeb6ef3cfb5d6f1beb55ccb7b0722e0cfceae4ff78279942840d1d1c494c92b9f7edfa47c41b87c77f09e021a29df4aef76412782'
  '62e2d60fdd39243e6245d90a0940b67ac4e72d042d8146203d50cdaa2df51611d91831d3b152d42302490afd677ae3433a3eba975dee68dbf7c06728167bb6d4'
  #'5d96a288ae925584cdcde0305c511b18e3cfaed6cae49f5fc6f062f62100d10a087144e8263380d19a14dca71c745065ddaa0062542c2e2cfa1db04811d40dc7'
  #'a9ee92fd135c47a27ac260ab40c057f0e35c118efcb281e98e235158ffd8599acede67dcce6da4c2589b2a0bd794c587af80d4ce4f85c1b9823cb9acfbbe9050'
  'aeee097dbf46aa22f411d78a49b9db7b2451dd0351bb5f57c7b3159c7ddc29aa994cd43046c187033c474f8fb2952165536197139eb7c495db99f6697f41637d'
  #'beaa201496c1c670f5fe1e99b88308fff16502ed5ac0d6dce3077be9ea44f6e30d5cd0946e5bf5f11c4b174f9afe372fa198c8ef278f5c5511aa2410d3441ec2'
  'd5866e37d3e0449f26c5783298c60c188648722d215dfdc3783d4ac09cf023bf95a8ac4b25d15aa6314b187ab3723b697d4ed8c0b7beb3d2d46956e985ce90bf'
  'd63bfaa08225a4c467945b7b849747ce33f1c10e2e34ed4dbb8f02b31d392ba3a7f3c96377222ba25bfb9eec5beebfe9130358790bfd853c180c63015b4ec249'
  'fbf8ba29eefef98a0596d255e7dab24790d828d466f06f209c63280d31a25950c88cc354296c0da9a5bd085384fa59f296809cad1ab8db6712d8158ac74da343'
  'ea1d31d84ca30fffa60b6eb06d1f532c75ff5a8acec893479cbe0f3669c62e5da9ee81be8549bae75d63e4b6fe69a4ffe6dfd4e3008e731e320d6da4bc4beae9'
  '298e47a21c337101974fa5237b3110aa3c7638b5fa53bd07661413236c8ed3212b431abaeffd875af6c9a72b4f8e1c8512e1e1960cbfff15bfee62b32d305fc3'
)

b2sums=(
  'adfdbba09c244b67007570958a15ac06fc5edd6d54a07d9efe60a58fac1e932341ca1c91f85b6a7f762a9f6a4ee4e98c306875b6ca7123003fcff5de9881b705'
  '1e6c8d39052bdc268c584488341e260a2695d4b9afabca41919710bb34833dd580ff1813c01b8ba91f2629273c8101ce0ed3b2749dabce054137b4ef37b2a548'
  #'051b7c350333ce57a4a5e57ba0f693aed4491a241fd9e65cf2a861773571b44b8d4ffa06506a0c4a05399a46108ec05321e69f210637f32e25c76e683b224505'
  #'b46019363a19e2a0c397d66b6f1dc24d1c1219372b7fd699d92a9c382b24b02437b37cb12b3bba7e3ca97cfe98170ad21fff5871daf2070bc3d175fe0b31680b'
  'a6ff4e82a92e7dba08f0e6c14ad1d280ad2dbc1d5ebdc7dc70eaa1b7963ddd5d5491fdf4c83cde1bec183b335ed20edaf101ac8bdb3c0f480adc72d41251723b'
  #'74fc72fe0f028e7b495b2a96df26ef9fd76648f2701bbfc2b271f5b55968b82951f1b7232435c2bdf9e92b74a69f0d8cf804c8ef1be7f9c226896cb17ba57166'
  'be20c26e65fa602a14dcf1d325dbd83a230b1ca4afc7393d35ae9bd278667fb2f400dd6b34cf601199b7b0318c56248a62fb97153cc2663a64836fa05dc3144f'
  '95089ed180537f516214b5ba1d6a6d50ecb30277ffa67abbd3f0f32f95469d187f8e77ae19536c06563b7ac0a930ed9427485c6e400a08be3c6180607c1400cb'
  'ffb96a24fe6179f939b0776496bf93ff666fae9144a36fe70b3a8acd69c053221385c5e3527132123285fb0aaeefc50148e806d53692b41acf0668ed5c7172f7'
  '3d47ff65d0e69ec76e7390ab52c33a7ec39e403fc86dd9c0546b8a876ef69f44d60f4d833ac18c007b776a202eb33d08369165670857e718589c6f4f8a51a564'
  '557d015bca7008ce824111f235da67b7e0051a693aaab666e97b78e753ed7928b72274af03d7fde12033986b733d5f996faf2a4feb6ecf53f39accae31334930'
)

install=$pkgname.install

build() {
  cd openssh-portable-hpn-${_pkgver}/

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

  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/ssh \
    --sysconfdir=/etc/ssh \
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

package() {
  cd openssh-portable-hpn-${_pkgver}/

  make DESTDIR="${pkgdir}" install

  ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -Dm644 ../sshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/sshdgenkeys.service
  install -Dm644 ../sshd@.service "${pkgdir}"/usr/lib/systemd/system/sshd@.service
  install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
  install -Dm644 ../sshd.socket "${pkgdir}"/usr/lib/systemd/system/sshd.socket
  install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

  install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
  install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
  install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

  sed \
    -e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
    -e '/^#PrintMotd yes$/c PrintMotd no # pam does that' \
    -e '/^#UsePAM no$/c UsePAM yes' \
    -i "${pkgdir}"/etc/ssh/sshd_config
}

