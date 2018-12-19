# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgbase=systemd-selinux
pkgname=('systemd-selinux' 'libsystemd-selinux' 'systemd-resolvconf-selinux' 'systemd-sysvcompat-selinux')
# Can be from either systemd or systemd-stable
_commit='3bf819c4ca718a6bc4b3b871cf52a0d1b518967d'
pkgver=239.370
pkgrel=1
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
groups=('selinux')
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam-selinux' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn2' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-lxml' 'quota-tools' 'shadow-selinux' 'gnu-efi-libs' 'git'
             'meson' 'libseccomp' 'pcre2' 'audit' 'kexec-tools' 'libxkbcommon'
             'bash-completion' 'libselinux')
options=('strip')
validpgpkeys=('63CDA1E5D3FC22B998D20DD6327F26951A015CC4'  # Lennart Poettering <lennart@poettering.net>
              '5C251B5FC54EB2F80F407AAAC54CA336CFEB557E') # Zbigniew Jędrzejewski-Szmek <zbyszek@in.waw.pl>
# Retrieve the splash-arch.bmp image from systemd package sources, as this
# file is too big to fit in the AUR.
#
# systemd 238.0-2 removed the ".git" from the Github URLs
# (cf. https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/systemd&id=fa248b709cd106bf65b42f3e93e68decc811e163 )
# When updating, if makepkg reports "systemd-stable is not a clone of https://github.com/systemd/systemd-stable",
# you need to update the remotes of the git repositories, for example with the following commands:
#   git -C systemd-stable remote set-url origin https://github.com/systemd/systemd-stable
#   git -C systemd remote set-url origin https://github.com/systemd/systemd
source=(# fragment is latest tag for source verification, final merge in prepare()
        "git+https://github.com/systemd/systemd-stable#tag=v${pkgver%.*}?signed"
        "git+https://github.com/systemd/systemd#tag=v${pkgver%.*}?signed"
        '0001-Use-Arch-Linux-device-access-groups.patch'
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        'arch.conf'
        'loader.conf'
        'splash-arch.bmp::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/splash-arch.bmp?h=packages/systemd&id=e43ddb71a5b1ab56e898347a63e54c5d5d07728a'
        'systemd-user.pam'
        'systemd-hook'
        'systemd-binfmt.hook'
        'systemd-catalog.hook'
        'systemd-daemon-reload.hook'
        'systemd-hwdb.hook'
        'systemd-sysctl.hook'
        'systemd-sysusers.hook'
        'systemd-tmpfiles.hook'
        'systemd-udev-reload.hook'
        'systemd-update.hook')
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
            '6b82386fc20619eefa911cd9cdac8efbd0c7137bba4955e8ae75a0ea378d19dbfccc1f7bde6684f03e5f2badefa4abf20623153d88a170d14499167319586db7'
            '5a6b6beef8c31c79018884d948de840f4d3dfb07d9a87081ebf65e2b8fe595bc8c96dbd7742920ccf948c233213ed0026abc913650cefd77ad90c6f8c89bddb8'
            '4cff2ebd962e26e2f516d8b4ac45c839dbfa54dd0588b423c224a328b9f7c62306ca7b2f6cb55240c564caf9972d5bcd2e0efaf2de49d64729aeb3bc1560c9eb'
            '872de70325e9798f0b5a77e991c85bd2ab6de24d9b9ba4e35002d2dd5df15f8b30739a0042a624776177ffc14a838cde7ee98622016ed41df3efda9a659730b2'
            '471342b8d0e05533908cda5d6a906050a51e3181beda1239e91d717029ee40a9eaed714996a445417d87c4e31b7f8522a665de176077fe0536d538369594996d'
            'da783e3bfc6469b92dee4064a13e2b427520d3d96b57c95a4e07aaca3e844d95210a8b16122b022080f5452d65096f274dd1c1467725bbdb2e40ef304b78774a'
            '08a590d08043a21f30f04252164b94df972b1ff1022a0469d6aef713e14484a3a037cce290a2a582851e6fac3e64add69d6cc8fc130bbeeaea08626ebf3e1763'
            '577e33a1c50b4b41157a67f64162b035dd0c4a541e19cee55a100048bdb50cb2c82852741b1372989a0fe4c4782ba477522747fcc81d72aed99b3db512a86447'
            'e4a9d7607fe93daf1d45270971c8d8455c4bfc2c0bea8bcad05aeb89847edee23cd1a41073a72042622acf417018fe254f5bfc137604fe2c71292680bf67a1c2'
            '209b01b044877cc986757fa4009a92ea98f480306c2530075d153203c3cd2b3afccab6aacc1453dee8857991e04270572f1700310705d7a0f4d5bed27fab8c67')

_backports=(
)

_reverts=(
)

prepare() {
  cd "${pkgbase/-selinux}-stable"

  # add upstream repository for cherry-picking
  git remote add -f upstream ../systemd
  # merge the latest stable commit (fast-foward only to make sure
  # the verified tag is in)
  git merge --ff-only "${_commit}"

  local _c
  for _c in "${_backports[@]}"; do
    git cherry-pick -n "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git revert -n "${_c}"
  done

  # Replace cdrom/dialout/tape groups with optical/uucp/storage
  patch -Np1 -i ../0001-Use-Arch-Linux-device-access-groups.patch
}

pkgver() {
  cd "${pkgbase/-selinux}-stable"

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
    -Daudit=true
    -Dgnu-efi=true
    -Dima=false
    -Dlibidn2=true
    -Dlz4=true
    -Dselinux=true

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    # TODO(dreisner): consider changing this to unified
    -Ddefault-hierarchy=hybrid
    -Ddefault-kill-user-processes=false
    -Dfallback-hostname='archlinux'
    -Dntp-servers="${_timeservers[*]}"
    -Ddns-servers="${_nameservers[*]}"
    -Drpmmacrosdir=no
    -Dsysvinit-path=
    -Dsysvrcnd-path=
  )

  # meson needs a UTF-8 locale. Otherwise it displays the following error message:
  #   WARNING: You are using 'ANSI_X3.4-1968' which is not a a Unicode-compatible locale.
  #   WARNING: You might see errors if you use UTF-8 strings as filenames, as strings, or as file contents.
  #   WARNING: Please switch to a UTF-8 locale for your platform.
  # c.f. https://github.com/mesonbuild/meson/blob/0.42.0/meson.py#L21
  if ! (echo "$LANG" | grep -i '\.utf-\?8' > /dev/null) ; then
    export LANG="$(locale -a | grep -i '\.utf-\?8' | head -n1)"
    if [ -z "$LANG" ] ; then
      echo >&2 "Unable to find a UTF-8 locale on the system"
      return 1
    fi
  fi

  arch-meson "${pkgbase/-selinux}-stable" build "${_meson_options[@]}"

  ninja -C build
}

check() {
  meson test -C build
}

package_systemd-selinux() {
  pkgdesc='system and service manager with SELinux support'
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'bash' 'cryptsetup' 'dbus' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' 'libsystemd-selinux' 'libidn2' 'lz4' 'pam-selinux' 'libelf' 'libseccomp'
           'util-linux-selinux' 'xz' 'pcre2' 'audit')
  provides=('nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver"
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=('nss-myhostname' 'systemd-tools' 'udev'
             "${pkgname/-selinux}" 'selinux-systemd')
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
          etc/systemd/system.conf
          etc/systemd/timesyncd.conf
          etc/systemd/resolved.conf
          etc/systemd/user.conf
          etc/udev/udev.conf)
  install=systemd.install

  DESTDIR="$pkgdir" meson install -C build

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -rv "$pkgdir"/etc/systemd/system/*

  # we'll create this on installation
  rmdir "$pkgdir"/var/log/journal/remote

  # runtime libraries shipped with libsystemd
  install -d -m0755 libsystemd
  mv "$pkgdir"/usr/lib/lib{nss,systemd,udev}*.so* libsystemd

  # manpages shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/share/man/man8/{halt,poweroff,reboot,runlevel,shutdown,telinit}.8

  # executable (symlinks) shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/bin/{halt,init,poweroff,reboot,runlevel,shutdown,telinit}

  # files shipped with systemd-resolvconf
  rm "$pkgdir"/usr/{bin/resolvconf,share/man/man1/resolvconf.1}

  # avoid a potential conflict with [core]/filesystem
  rm "$pkgdir"/usr/share/factory/etc/nsswitch.conf
  sed -i '/^C \/etc\/nsswitch\.conf/d' "$pkgdir"/usr/lib/tmpfiles.d/etc.conf

  # add back tmpfiles.d/legacy.conf, normally omitted without sysv-compat
  install -m0644 ${pkgbase/-selinux}-stable/tmpfiles.d/legacy.conf "$pkgdir"/usr/lib/tmpfiles.d

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
  install -D -m0644 arch.conf "$pkgdir"/usr/share/systemd/bootctl/arch.conf
  install -D -m0644 loader.conf "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -D -m0644 splash-arch.bmp "$pkgdir"/usr/share/systemd/bootctl/splash-arch.bmp

  # pacman hooks
  install -D -m0755 systemd-hook "$pkgdir"/usr/share/libalpm/scripts/systemd-hook
  install -D -m0644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook

  # overwrite the systemd-user PAM configuration with our own
  install -D -m0644 systemd-user.pam "$pkgdir"/etc/pam.d/systemd-user
}

package_libsystemd-selinux() {
  pkgdesc='systemd client libraries with SELinux support'
  depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz' 'libselinux')
  license=('GPL2')
  provides=('libsystemd.so' 'libudev.so'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=("${pkgname/-selinux}")

  install -d -m0755 "$pkgdir"/usr
  mv libsystemd "$pkgdir"/usr/lib
}

package_systemd-resolvconf-selinux() {
  pkgdesc='systemd resolvconf replacement with SELinux support'
  license=('GPL2')
  depends=('systemd-selinux')
  provides=('openresolv' 'resolvconf' "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=('openresolv' "${pkgname/-selinux}=${pkgver}-${pkgrel}")

  install -d -m0755 "$pkgdir"/usr/bin
  ln -s resolvectl "$pkgdir"/usr/bin/resolvconf

  install -d -m0755 "$pkgdir"/usr/share/man/man1
  ln -s resolvectl.1.gz "$pkgdir"/usr/share/man/man1/resolvconf.1.gz
}

package_systemd-sysvcompat-selinux() {
  pkgdesc='sysvinit compat for systemd with SELinux support'
  license=('GPL2')
  conflicts=('sysvinit' "${pkgname/-selinux}" 'selinux-systemd-sysvcompat')
  depends=('systemd-selinux')
  provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
            "selinux-systemd-sysvcompat=${pkgver}-${pkgrel}")

  install -D -m0644 -t "$pkgdir"/usr/share/man/man8 \
    build/man/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8

  install -d -m0755 "$pkgdir"/usr/bin
  ln -s ../lib/systemd/systemd "$pkgdir"/usr/bin/init
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s systemctl "$pkgdir"/usr/bin/$tool
  done
}

# vim:ft=sh syn=sh et sw=2:
