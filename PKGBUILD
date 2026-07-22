# Maintainer: upakovka <upakovka@proton.me>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt-apparmor
epoch=1
pkgver=12.5.0
pkgrel=1
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('x86_64')
url="https://libvirt.org/"
license=(
  'LGPL-2.1-or-later'
  'GPL-3.0-or-later' # libvirt_parthelper links to libparted
) 
depends=(
  acl
  apparmor
  audit
  bash
  curl
  device-mapper
  fuse3
  libgcc
  glib2
  glibc
  gnutls
  json-c
  libcap-ng
  libnbd
  libnl
  libpcap
  libpciaccess
  libsasl
  libssh
  libssh2
  libtirpc
  libxml2
  numactl
  parted
  polkit
  readline
  systemd-libs
  util-linux-libs
)
makedepends=(
  bash-completion
  git
  glusterfs
  libiscsi
  libxslt
  meson
  python-docutils
  systemd
)
optdepends=(
  'dmidecode: DMI system info support'
  'dnsmasq: required for default NAT/DHCP for guests'
  'gettext: required for libvirt-guests.service'
  'iptables-nft: required for default NAT networking'
  'libvirt-python: for virt-qemu-qmp-proxy and virt-qemu-sev-validate commands'
  'libvirt-storage-gluster: Gluster storage backend'
  'libvirt-storage-iscsi-direct: iSCSI-direct storage backend'
  'lvm2: Logical Volume Manager support'
  'openbsd-netcat: for remote management over ssh'
  'open-iscsi: iSCSI support via iscsiadm'
  'python-cryptography: for virt-qemu-sev-validate command'
  'python-lxml: for virt-qemu-sev-validate command'
  'qemu-base: QEMU/KVM support'
  'qemu-desktop: QEMU/KVM desktop support'
  'qemu-emulators-full: Support of additional QEMU architectures'
  'radvd: IPv6 RAD support'
  'swtpm: TPM emulator support'
)
provides=(
  "libvirt=$pkgver"
  libvirt.so
  libvirt-admin.so
  libvirt-lxc.so
  libvirt-qemu.so
)
conflicts=('libvirt')

backup=(
  'etc/apparmor.d/libvirt/TEMPLATE.lxc'
  'etc/apparmor.d/libvirt/TEMPLATE.qemu'
  'etc/apparmor.d/abstractions/libvirt-lxc'
  'etc/apparmor.d/abstractions/libvirt-qemu'
  'etc/apparmor.d/usr.lib.libvirt.virt-aa-helper'
  'etc/apparmor.d/usr.sbin.libvirtd'
  'etc/apparmor.d/usr.sbin.virtqemud'
  'etc/apparmor.d/usr.sbin.virtxend'
  'etc/libvirt/libvirt-admin.conf'
  'etc/libvirt/libvirt.conf'
  'etc/libvirt/libvirtd.conf'
  'etc/libvirt/lxc.conf'
  'etc/libvirt/network.conf'
  'etc/libvirt/nwfilter/allow-arp.xml'
  'etc/libvirt/nwfilter/allow-dhcp-server.xml'
  'etc/libvirt/nwfilter/allow-dhcpv6-server.xml'
  'etc/libvirt/nwfilter/allow-dhcp.xml'
  'etc/libvirt/nwfilter/allow-dhcpv6.xml'
  'etc/libvirt/nwfilter/allow-incoming-ipv4.xml'
  'etc/libvirt/nwfilter/allow-incoming-ipv6.xml'
  'etc/libvirt/nwfilter/allow-ipv6.xml'
  'etc/libvirt/nwfilter/allow-ipv4.xml'
  'etc/libvirt/nwfilter/clean-traffic-gateway.xml'
  'etc/libvirt/nwfilter/clean-traffic.xml'
  'etc/libvirt/nwfilter/no-arp-ip-spoofing.xml'
  'etc/libvirt/nwfilter/no-arp-mac-spoofing.xml'
  'etc/libvirt/nwfilter/no-arp-spoofing.xml'
  'etc/libvirt/nwfilter/no-ip-multicast.xml'
  'etc/libvirt/nwfilter/no-ipv6-multicast.xml'
  'etc/libvirt/nwfilter/no-ip-spoofing.xml'
  'etc/libvirt/nwfilter/no-ipv6-spoofing.xml'
  'etc/libvirt/nwfilter/no-mac-spoofing.xml'
  'etc/libvirt/nwfilter/no-mac-broadcast.xml'
  'etc/libvirt/nwfilter/no-other-l2-traffic.xml'
  'etc/libvirt/nwfilter/no-other-rarp-traffic.xml'
  'etc/libvirt/nwfilter/qemu-announce-self-rarp.xml'
  'etc/libvirt/nwfilter/qemu-announce-self.xml'
  'etc/libvirt/network.conf'
  'etc/libvirt/qemu.conf'
  'etc/libvirt/qemu-lockd.conf'
  'etc/libvirt/qemu/networks/default.xml'
  'etc/libvirt/virtchd.conf'
  'etc/libvirt/virtinterfaced.conf'
  'etc/libvirt/virtlockd.conf'
  'etc/libvirt/virtlogd.conf'
  'etc/libvirt/virt-login-shell.conf'
  'etc/libvirt/virtlxcd.conf'
  'etc/libvirt/virtnetworkd.conf'
  'etc/libvirt/virtnodedevd.conf'
  'etc/libvirt/virtnwfilterd.conf'
  'etc/libvirt/virtproxyd.conf'
  'etc/libvirt/virtqemud.conf'
  'etc/libvirt/virtsecretd.conf'
  'etc/libvirt/virtstoraged.conf'
  'etc/libvirt/virtvboxd.conf'
  'etc/logrotate.d/libvirtd'
  'etc/logrotate.d/libvirtd.lxc'
  'etc/logrotate.d/libvirtd.qemu'
  'etc/sasl2/libvirt.conf'
)
source=(
  "${pkgname}::git+https://gitlab.com/libvirt/libvirt.git#tag=v${pkgver}"
)
sha256sums=('78c8552dbe4fe062f7e0ee16c3a26ef9c4933d2cb8eb8483d98dbc01e2cb9656')

prepare() {
  cd ${pkgname}
  sed -i 's|/sysconfig/|/conf.d/|g' \
    src/remote/libvirtd.service.in \
    tools/{libvirt-guests.service,libvirt-guests.sh}.in \
    docs/manpages/libvirt-guests.rst \
    src/locking/virtlockd.service.in \
    src/logging/virtlogd.service.in
  sed -i 's|/usr/libexec/qemu-bridge-helper|/usr/lib/qemu/qemu-bridge-helper|g' \
    src/qemu/qemu.conf.in \
    src/qemu/test_libvirtd_qemu.aug.in
}

build() {
  cd ${pkgname}

  arch-meson build \
    -Dwerror=false -Dgit_werror=disabled \
    --libexecdir=lib/libvirt \
    -Drunstatedir=/run \
    -Dqemu_user=libvirt-qemu \
    -Dqemu_group=libvirt-qemu \
    -Dnetcf=disabled \
    -Dopenwsman=disabled \
    -Dapparmor=enabled \
    -Dapparmor_profiles=enabled \
    -Dselinux=disabled \
    -Dwireshark_dissector=disabled \
    -Ddriver_bhyve=disabled \
    -Ddriver_hyperv=disabled \
    -Ddriver_libxl=disabled \
    -Ddriver_vz=disabled \
    -Dsanlock=disabled \
    -Dsecdriver_apparmor=enabled \
    -Dsecdriver_selinux=disabled \
    -Dstorage_vstorage=disabled \
    -Ddtrace=disabled \
    -Dnumad=disabled \
    -Dstorage_zfs=enabled\
    -Dstorage_rbd=disabled

  meson compile -C build
}

check() {
  cd ${pkgname}

  meson test -C build --print-errorlogs
}

package() {
  cd ${pkgname}
  meson install -C build --destdir ${pkgdir}

  mkdir -p "${pkgdir}"/usr/lib/{sysusers,tmpfiles}.d
  echo 'g libvirt - -' > "${pkgdir}"/usr/lib/sysusers.d/libvirt-qemu.conf
  echo 'u! libvirt-qemu /var/lib/libvirt "Libvirt QEMU user"' >> "${pkgdir}"/usr/lib/sysusers.d/libvirt.conf
  echo 'm libvirt-qemu kvm' >> "${pkgdir}"/usr/lib/sysusers.d/libvirt.conf
  echo 'z /var/lib/libvirt/qemu 0751' > "${pkgdir}"/usr/lib/tmpfiles.d/libvirt.conf

  chmod 600 "${pkgdir}"/etc/libvirt/nwfilter/*.xml \
    "${pkgdir}"/etc/libvirt/qemu/networks/default.xml
  chmod 700 "${pkgdir}"/etc/libvirt/secrets
  chmod 711 "${pkgdir}"/var/lib/libvirt/swtpm

  rm -rf \
    "${pkgdir}"/run \
    "${pkgdir}"/var/lib/libvirt/qemu \
    "${pkgdir}"/var/cache/libvirt/qemu \
    "${pkgdir}"/etc/logrotate.d/libvirtd.libxl

  rm -f "${pkgdir}"/etc/libvirt/qemu/networks/autostart/default.xml

  # remove split modules
  rm -f "${pkgdir}"/usr/lib/libvirt/storage-backend/libvirt_storage_backend_gluster.so
  rm -f "${pkgdir}"/usr/lib/libvirt/storage-backend/libvirt_storage_backend_iscsi-direct.so
  rm -f "${pkgdir}"/usr/lib/libvirt/storage-file/libvirt_storage_file_gluster.so
}
