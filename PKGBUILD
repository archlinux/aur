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
_openssh_ver=8.3p1
_hpn_ver=hpn14v22
#_pkgver="`sed -e 's/\./_/' -e 's/p/_P/' <<< ${_openssh_ver}`_new"
_pkgver="`sed -e 's/\./_/' -e 's/p/_P/' <<< ${_openssh_ver}`"
pkgver="${_openssh_ver}.${_hpn_ver}"
pkgrel=2
pkgdesc='A Secure SHell server/client fork with High Performance patches included'
url='https://www.psc.edu/index.php/hpn-ssh/'
license=('custom:BSD')
arch=('x86_64' 'i486' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('krb5' 'ldns' 'libedit' 'openssl')
makedepends=('git' 'libfido2')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X'
            'libfido2: FIDO/U2F support')
provides=('openssh'
          'openssh-hpn')
conflicts=('openssh'
           'openssh-hpn'
           'openssh-hpn-git')
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

sha256sums=(
  '99eb35ef529859e082dfdf004d227ad3d080e305782b1864531e1f877bdcc98d'
  '007a8888855570296c36716df18e986b7265c283e8fc8f6dfd4b3c411905fdb3'
  #'6c6deb799fc918b4d90899d664a23b3a99e2973d61b5a2cf68e1ea9a6604ca9a'
  #'57bb8c4800afc5314ad1f3ac24bc838f1f63c626171d3c5ad4b843bfef2391fe'
  '25b4a4d9e2d9d3289ef30636a30e85fa1c71dd930d5efd712cca1a01a5019f93'
  #'9c5a150fa3d7c23699a3f37980603e220783fc12595fdf25db9ef7eb4e91ff96'
  'ff3cbdd0e59ff7dac4dc797d5c0f2b1db4117ddbb49d52f1c4f1771961903878'
  '69cc2abaaae0aa8071b8eac338b2df725f60ce73381843179b74eaac78ba7f1d'
  'c5ed9fa629f8f8dbf3bae4edbad4441c36df535088553fe82695c52d7bde30aa'
  'de14363e9d4ed92848e524036d9e6b57b2d35cc77d377b7247c38111d2a3defd'
  '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846'
)

b2sums=(
  '9ba0717bee12cd3b9d5eadbdce539b75bf0ab4fc48f7199e8d78815e5ac2e984181d883dd38a20f3cb7dc2b94726bf3510f5bee57f64c5e6f3c6f8a2a7151fc1'
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

