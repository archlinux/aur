# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

# Specify "systemd" to use systemd-backlight, any other backlight control (light, xorg-xbacklight, etc) or "none" to remove dependency.
# See https://wiki.archlinux.org/index.php/Backlight#Backlight_utilities
_backlight="systemd"

# Specify "systemd" to use bootctl, any other boot loader (grub, syslinux, etc) or "none" to remove dependency (not recommended, except if you use EFI stub)
# See https://wiki.archlinux.org/index.php/Arch_boot_process#Boot_loader
_bootloader="systemd"

# Specify "systemd" to use systemd-networkd, any other network manager (connman, networkmanager, etc) or "none" to remove dependency.
# See https://wiki.archlinux.org/index.php/Network_configuration#Network_managers
_network="systemd"

# Specify "systemd" to use systemd-resolved, any other DNS server (dnsmasq, unbound, etc) or "none" to remove dependency.
# See https://wiki.archlinux.org/index.php/Domain_name_resolution#DNS_servers
_resolver="systemd"

# Specify "systemd" to use systemd-timesyncd, any other NTP client (chrony, ntp, etc) or "none" to remove dependency.
# See https://wiki.archlinux.org/index.php/System_time#Time_synchronization
_timesync="systemd"

# Prepend with ! to disable support.
_security=(seccomp !selinux !apparmor !smack)

# Specify non-empty to enable these features
_cryptsetup="y"  # Disk encryption (LUKS)
_clear=""  #  Clearlinux patches

pkgbase=systemd-light
_pkgbase=${pkgbase%-light}
pkgname=('systemd-light' 'systemd-light-libs')
# Can be from either systemd or systemd-stable
_commit='e51d9bf9e5ac5a6618c175cd9b5cfdc6733cd5d1'
pkgver=243.162
pkgrel=1
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
makedepends=('acl' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn2' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-lxml' 'quota-tools' 'shadow' 'git'
             'meson' 'pcre2' 'audit' 'kexec-tools' 'libxkbcommon'
             'bash-completion')
options=('strip')
validpgpkeys=('63CDA1E5D3FC22B998D20DD6327F26951A015CC4'  # Lennart Poettering <lennart@poettering.net>
              '5C251B5FC54EB2F80F407AAAC54CA336CFEB557E') # Zbigniew Jędrzejewski-Szmek <zbyszek@in.waw.pl>
source=(# fragment is latest tag for source verification, final merge in prepare()
        "git+https://github.com/systemd/systemd-stable#tag=v${pkgver%.*}?signed"
        "git+https://github.com/systemd/systemd#tag=v${pkgver%.*}?signed"
        '0001-Use-Arch-Linux-device-access-groups.patch'
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        'arch.conf'
        'loader.conf'
        'splash-arch.bmp::https://git.archlinux.org/svntogit/packages.git/plain/trunk/splash-arch.bmp?h=packages/systemd'
        'systemd-user.pam'
        'systemd-hook'
        '20-systemd-sysusers.hook'
        '30-systemd-binfmt.hook'
        '30-systemd-catalog.hook'
        '30-systemd-daemon-reload.hook'
        '30-systemd-hwdb.hook'
        '30-systemd-sysctl.hook'
        '30-systemd-tmpfiles.hook'
        '30-systemd-udev-reload.hook'
        '30-systemd-update.hook')
sha512sums=('SKIP'
            'SKIP'
            '9348683829190628e25b7b3300fd880c426d555bde330d5fc5150a9a54b3ad9d4d1f2e69ea1dc6d6f086693dacc53c5af30f1fa7ad9b479791fd77bcdafa430e'
            'f0d933e8c6064ed830dec54049b0a01e27be87203208f6ae982f10fb4eddc7258cb2919d594cbfb9a33e74c3510cfd682f3416ba8e804387ab87d1a217eb4b73'
            '01de24951a05d38eca6b615a7645beb3677ca0e0f87638d133649f6dc14dcd2ea82594a60b793c31b14493a286d1d11a0d25617f54dbfa02be237652c8faa691'
            'a25b28af2e8c516c3a2eec4e64b8c7f70c21f974af4a955a4a9d45fd3e3ff0d2a98b4419fe425d47152d5acae77d64e69d8d014a7209524b75a81b0edb10bf3a'
            '61032d29241b74a0f28446f8cf1be0e8ec46d0847a61dadb2a4f096e8686d5f57fe5c72bcf386003f6520bc4b5856c32d63bf3efe7eb0bc0deefc9f68159e648'
            'c416e2121df83067376bcaacb58c05b01990f4614ad9de657d74b6da3efa441af251d13bf21e3f0f71ddcb4c9ea658b81da3d915667dc5c309c87ec32a1cb5a5'
            '5a1d78b5170da5abe3d18fdf9f2c3a4d78f15ba7d1ee9ec2708c4c9c2e28973469bc19386f70b3cf32ffafbe4fcc4303e5ebbd6d5187a1df3314ae0965b25e75'
            'b90c99d768dc2a4f020ba854edf45ccf1b86a09d2f66e475de21fe589ff7e32c33ef4aa0876d7f1864491488fd7edb2682fc0d68e83a6d4890a0778dc2d6fe19'
            '869dab2b1837c964add4019bb402e24e52dbb7f009850ca69fcc5deddd923eeb98eb8ee38601f6e31531f30322472fe7df09af84df27f0467708406c55885323'
            '08a590d08043a21f30f04252164b94df972b1ff1022a0469d6aef713e14484a3a037cce290a2a582851e6fac3e64add69d6cc8fc130bbeeaea08626ebf3e1763'
            '5a6b6beef8c31c79018884d948de840f4d3dfb07d9a87081ebf65e2b8fe595bc8c96dbd7742920ccf948c233213ed0026abc913650cefd77ad90c6f8c89bddb8'
            '4cff2ebd962e26e2f516d8b4ac45c839dbfa54dd0588b423c224a328b9f7c62306ca7b2f6cb55240c564caf9972d5bcd2e0efaf2de49d64729aeb3bc1560c9eb'
            '872de70325e9798f0b5a77e991c85bd2ab6de24d9b9ba4e35002d2dd5df15f8b30739a0042a624776177ffc14a838cde7ee98622016ed41df3efda9a659730b2'
            '471342b8d0e05533908cda5d6a906050a51e3181beda1239e91d717029ee40a9eaed714996a445417d87c4e31b7f8522a665de176077fe0536d538369594996d'
            'da783e3bfc6469b92dee4064a13e2b427520d3d96b57c95a4e07aaca3e844d95210a8b16122b022080f5452d65096f274dd1c1467725bbdb2e40ef304b78774a'
            '577e33a1c50b4b41157a67f64162b035dd0c4a541e19cee55a100048bdb50cb2c82852741b1372989a0fe4c4782ba477522747fcc81d72aed99b3db512a86447'
            'e4a9d7607fe93daf1d45270971c8d8455c4bfc2c0bea8bcad05aeb89847edee23cd1a41073a72042622acf417018fe254f5bfc137604fe2c71292680bf67a1c2'
            '209b01b044877cc986757fa4009a92ea98f480306c2530075d153203c3cd2b3afccab6aacc1453dee8857991e04270572f1700310705d7a0f4d5bed27fab8c67')

_backports=(
)

_reverts=(
)

if [ "$_bootloader" = 'systemd' ]; then
  makedepends+=('gnu-efi-libs')
fi

if [ -n "$_cryptsetup" ]; then
  makedepends+=('cryptsetup')
fi

if [ -n "$_clear" ]; then
  local _clrrel=267
  source+=("clearlinux::git+https://github.com/clearlinux-pkgs/${_pkgbase}#tag=${pkgver%.*}-${_clrrel}")
  sha512sums+=('SKIP')
fi

bool_opt() {
  local needle=$1; shift

  local i opt
  for (( i = $#; i > 0; i-- )); do
    opt=${!i}
    if [ "$opt" = "$needle" ]; then
      # enabled
      echo "true"
      return
    elif [ "$opt" = "!$needle" ]; then
      # disabled
      echo "false"
      return
    fi
  done

  # not found
  echo "false"
}

for opt in seccomp selinux smack; do
  if [ "$(bool_opt "$opt" "${_security[@]}")" = "true" ]; then
    makedepends+=("lib${opt}")
  fi
done
if [ "$(bool_opt 'apparmor' "${_security[@]}")" = "true" ]; then
  makedepends+=('apparmor')
fi

is_nonempty() {
  if [ -n "$1" ]; then
    echo "true"
  else
    echo "false"
  fi
}

is_systemd() {
  if [ "$1" = 'systemd' ]; then
    echo "true"
  else
    echo "false"
  fi
}

prepare() {
  cd "$_pkgbase-stable"

  # add upstream repository for cherry-picking
  git remote add -f upstream ../systemd
  # merge the latest stable commit (fast-foward only to make sure
  # the verified tag is in)
  git merge --ff-only "${_commit}"

  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done

  if [ -n "$_clear" ]; then
    for i in $(grep '^Patch' "${srcdir}/clearlinux/${_pkgbase}.spec" | grep -Ev '^Patch0123' | sed -n 's/.*: //p'); do
      patch -Np1 -i "${srcdir}/clearlinux/${i}"
    done
  fi

  # Replace cdrom/dialout/tape groups with optical/uucp/storage
  patch -Np1 -i ../0001-Use-Arch-Linux-device-access-groups.patch
}

pkgver() {
  cd "$_pkgbase-stable"

  local _version _count
  _version="$(git describe --abbrev=0 --tags)"
  _count="$(git rev-list --count ${_version}..)"
  printf '%s.%s' "${_version#v}" "${_count}"
}

build() {
  local _timeservers=({0..3}.arch.pool.ntp.org)
  local _nameservers=(
    # We use these public name services, ordered by their
    # privacy policy (hopefully):
    #  * Cloudflare (https://1.1.1.1/)
    #  * Quad9 without filtering (https://www.quad9.net/)
    #  * Google (https://developers.google.com/speed/public-dns/)
    1.1.1.1
    9.9.9.10
    8.8.8.8
    2606:4700:4700::1111
    2620:fe::10
    2001:4860:4860::8888
  )

  local _meson_options=(
    -Dversion-tag="${pkgver}-${pkgrel}-arch"

    -Dima=false
    -Dlibidn2=true
    -Dlz4=true
    -Dman=true

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    -Ddefault-hierarchy=hybrid
    -Ddefault-locale=C
    -Ddefault-kill-user-processes=false
    -Dfallback-hostname='archlinux'
    -Dntp-servers="${_timeservers[*]}"
    -Ddns-servers="${_nameservers[*]}"
    -Drpmmacrosdir=no
    -Dsysvinit-path=
    -Dsysvrcnd-path=

    -Dbacklight=$(is_systemd "$_backlight")
    -Defi=$(is_systemd "$_bootloader")
    -Dgnu-efi=$(is_systemd "$_bootloader")
    -Dnetworkd=$(is_systemd "$_network")
    -Dresolve=$(is_systemd "$_resolver")
    -Dgnutls=$(is_systemd "$_resolver")
    -Dopenssl=$(is_systemd "$_resolver")
    -Dnss-resolve=$(is_systemd "$_resolver")
    -Dtimedated=$(is_systemd "$_timesync")
    -Dtimesyncd=$(is_systemd "$_timesync")
    -Dlibcryptsetup=$(is_nonempty "$_cryptsetup")
  )

  for opt in seccomp selinux apparmor smack; do
    _meson_options+=("-D${opt}=$(bool_opt "$opt" "${_security[@]}")")
  done

  arch-meson "$_pkgbase-stable" build "${_meson_options[@]}"

  ninja -C build
}

check() {
  meson test -C build
}

package_systemd-light() {
  pkgdesc='system and service manager'
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'bash' 'cryptsetup' 'dbus' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' "systemd-light-libs=$pkgver" 'libidn2' 'libidn2.so' 'lz4' 'pam' 'libelf'
           'util-linux' 'xz' 'pcre2' 'audit')
  provides=("systemd=$pkgver" 'nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver")
  replaces=('systemd' 'nss-myhostname' 'systemd-tools' 'udev')
  conflicts=('systemd' 'nss-myhostname' 'systemd-tools' 'udev')
  optdepends=('libmicrohttpd: remote journald capabilities'
              'quota-tools: kernel-level quota management'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries'
              'polkit: allow administration as unprivileged user'
              'curl: machinectl pull-tar and pull-raw')
  backup=(etc/pam.d/systemd-user
          etc/systemd/coredump.conf
          etc/systemd/journald.conf
          etc/systemd/journal-remote.conf
          etc/systemd/journal-upload.conf
          etc/systemd/logind.conf
          etc/systemd/sleep.conf
          etc/systemd/system.conf
          etc/systemd/user.conf
          etc/udev/udev.conf)
  install=systemd.install

  if [ "$_backlight" != "system" -a "$_backlight" != "none" ]; then
    optdepends+=("${_backlight}: replacement for systemd-backlight")
  fi

  if [ "$_bootloader" != "system" -a "$_bootloader" != "none" ]; then
    optdepends+=("${_bootloader}: replacement for bootctl")
  fi

  if [ "$_network" = "systemd" ]; then
    backup+=(etc/systemd/networkd.conf)
  elif [ "$_network" != "none" ]; then
    optdepends+=("${_network}: replacement for systemd-networkd")
  fi

  if [ "$_resolver" = "systemd" ]; then
    backup+=(etc/systemd/resolved.conf)
  elif [ "$_resolver" != "none" ]; then
    optdepends+=("${_resolver}: replacement for systemd-resolved")
  fi

  if [ "$_timesync" = "systemd" ]; then
    backup+=(etc/systemd/timesyncd.conf)
  elif [ "$_timesync" != "none" ]; then
    optdepends+=("${_resolver}: replacement for systemd-timesyncd")
  fi

  for opt in seccomp selinux smack; do
    if [ "$(bool_opt "$opt" "${_security[@]}")" = "true" ]; then
      depends+=("lib${opt}")
    fi
  done
  if [ "$(bool_opt 'apparmor' "${_security[@]}")" = "true" ]; then
    depends+=('apparmor')
  fi

  DESTDIR="$pkgdir" meson install -C build

  # we'll create this on installation
  rmdir "$pkgdir"/var/log/journal/remote

  # runtime libraries shipped with systemd-libs
  install -d -m0755 systemd-libs
  mv "$pkgdir"/usr/lib/lib{nss,systemd,udev}*.so* systemd-libs

  # manpages shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/share/man/man8/{halt,poweroff,reboot,runlevel,shutdown,telinit}.8

  # executable (symlinks) shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/bin/{halt,init,poweroff,reboot,runlevel,shutdown,telinit}

  # files shipped with systemd-resolvconf
  rm "$pkgdir"/usr/{bin/resolvconf,share/man/man1/resolvconf.1}

  # avoid a potential conflict with [core]/filesystem
  rm "$pkgdir"/usr/share/factory/etc/{issue,nsswitch.conf}
  sed -i -e '/^C \/etc\/nsswitch\.conf/d' \
    -e '/^C \/etc\/issue/d' "$pkgdir"/usr/lib/tmpfiles.d/etc.conf

  # add back tmpfiles.d/legacy.conf, normally omitted without sysv-compat
  install -m0644 $_pkgbase-stable/tmpfiles.d/legacy.conf "$pkgdir"/usr/lib/tmpfiles.d

  # ship default policy to leave services disabled
  echo 'disable *' >"$pkgdir"/usr/lib/systemd/system-preset/99-default.preset

  # add mkinitcpio hooks
  install -D -m0644 initcpio-install-systemd "$pkgdir"/usr/lib/initcpio/install/systemd
  install -D -m0644 initcpio-install-udev "$pkgdir"/usr/lib/initcpio/install/udev
  install -D -m0644 initcpio-hook-udev "$pkgdir"/usr/lib/initcpio/hooks/udev

  # ensure proper permissions for /var/log/journal
  # The permissions are stored with named group by tar, so this works with
  # users and groups populated by systemd-sysusers. This is only to prevent a
  # warning from pacman as permissions are set by systemd-tmpfiles anyway.
  install -d -o root -g systemd-journal -m 2755 "$pkgdir"/var/log/journal

  # match directory owner/group and mode from [extra]/polkit
  install -d -o root -g 102 -m 0750 "$pkgdir"/usr/share/polkit-1/rules.d

  # add example bootctl configuration
  if [ "$_bootloader" = 'systemd' ]; then
    install -D -m0644 arch.conf "$pkgdir"/usr/share/systemd/bootctl/arch.conf
    install -D -m0644 loader.conf "$pkgdir"/usr/share/systemd/bootctl/loader.conf
    install -D -m0644 splash-arch.bmp "$pkgdir"/usr/share/systemd/bootctl/splash-arch.bmp
  fi

  # pacman hooks
  install -D -m0755 systemd-hook "$pkgdir"/usr/share/libalpm/scripts/systemd-hook
  install -D -m0644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook

  # overwrite the systemd-user PAM configuration with our own
  install -D -m0644 systemd-user.pam "$pkgdir"/etc/pam.d/systemd-user
}

package_systemd-light-libs() {
  pkgdesc='systemd client libraries'
  depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz')
  license=('LGPL2.1')
  provides=("systemd-libs=$pkgver" 'libsystemd' 'libsystemd.so' 'libudev.so')
  conflicts=('systemd-libs' 'libsystemd')
  replaces=('systemd-libs' 'libsystemd')

  install -d -m0755 "$pkgdir"/usr
  mv systemd-libs "$pkgdir"/usr/lib
}

# vim:ft=sh syn=sh et sw=2:
