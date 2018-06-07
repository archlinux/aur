# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgbase=systemd-selinux
pkgname=('systemd-selinux' 'libsystemd-selinux' 'systemd-sysvcompat-selinux')
# Can be from either systemd or systemd-stable
_commit='f58e62cbbc1c2842881a2a6ab9beda7bcb044a30'
pkgver=238.133
pkgrel=1
arch=('x86_64')
url="https://www.github.com/systemd/systemd"
groups=('selinux')
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam-selinux' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-lxml' 'quota-tools' 'shadow-selinux' 'gnu-efi-libs' 'git'
             'meson' 'libseccomp' 'pcre2' 'libselinux')
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
source=('git+https://github.com/systemd/systemd-stable'
        'git+https://github.com/systemd/systemd'
        '0001-Use-Arch-Linux-device-access-groups.patch'
        'gnupg-keys.gpg'
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
            '42dcacfa0b0c68b04267446d2c360e508dab13f06c07506f46632b19fca0561c27bb5813cd916f7d28b53f853f7197f721c1a02aacd7a3cc8d8742bb6a393cff'
            'f0d933e8c6064ed830dec54049b0a01e27be87203208f6ae982f10fb4eddc7258cb2919d594cbfb9a33e74c3510cfd682f3416ba8e804387ab87d1a217eb4b73'
            '01de24951a05d38eca6b615a7645beb3677ca0e0f87638d133649f6dc14dcd2ea82594a60b793c31b14493a286d1d11a0d25617f54dbfa02be237652c8faa691'
            'a25b28af2e8c516c3a2eec4e64b8c7f70c21f974af4a955a4a9d45fd3e3ff0d2a98b4419fe425d47152d5acae77d64e69d8d014a7209524b75a81b0edb10bf3a'
            '61032d29241b74a0f28446f8cf1be0e8ec46d0847a61dadb2a4f096e8686d5f57fe5c72bcf386003f6520bc4b5856c32d63bf3efe7eb0bc0deefc9f68159e648'
            'c416e2121df83067376bcaacb58c05b01990f4614ad9de657d74b6da3efa441af251d13bf21e3f0f71ddcb4c9ea658b81da3d915667dc5c309c87ec32a1cb5a5'
            '5a1d78b5170da5abe3d18fdf9f2c3a4d78f15ba7d1ee9ec2708c4c9c2e28973469bc19386f70b3cf32ffafbe4fcc4303e5ebbd6d5187a1df3314ae0965b25e75'
            'b90c99d768dc2a4f020ba854edf45ccf1b86a09d2f66e475de21fe589ff7e32c33ef4aa0876d7f1864491488fd7edb2682fc0d68e83a6d4890a0778dc2d6fe19'
            '462ed39bd5c90168079956a402abafe8f0910882e6876b165a2c27af73833d0cad1be9cdbcb3549b34652ea86e5d0dba044946a38797bd533fdd1f5a0083f63b'
            '46f93725bc94381300535737fd0186a3c096fa83661179eab0c450c7b164a87d9a5dd9abcf6ae98bdeb4bf50a4ba4f1944769948c236e4814f166ff03b0ee177'
            '4cff2ebd962e26e2f516d8b4ac45c839dbfa54dd0588b423c224a328b9f7c62306ca7b2f6cb55240c564caf9972d5bcd2e0efaf2de49d64729aeb3bc1560c9eb'
            '872de70325e9798f0b5a77e991c85bd2ab6de24d9b9ba4e35002d2dd5df15f8b30739a0042a624776177ffc14a838cde7ee98622016ed41df3efda9a659730b2'
            '471342b8d0e05533908cda5d6a906050a51e3181beda1239e91d717029ee40a9eaed714996a445417d87c4e31b7f8522a665de176077fe0536d538369594996d'
            '3b11e8956169e6d80eca6e6de1b3e42641454d9d7be48961d400754f2242077d69fb7bfbeb0904f35ce569511036a7c9614a4a1cc3096fba993f46ae65e02895'
            'bf3225011760695040e9f7be2560348e68e86eac0295f5a17a6f7e3dda7ad7c008812a15904e2071b53d5f8048891602c8a9a18608ac64930f2d8cc4fac2a319'
            'ff1429a7c88e21d578c25d07e8cd9568577feb5a940fe39a7a815cf8431c57ca951ac6b394c53d2cdeb4efc645572c0b1b670a48cafcc405db41a6602b548e35'
            'e4a9d7607fe93daf1d45270971c8d8455c4bfc2c0bea8bcad05aeb89847edee23cd1a41073a72042622acf417018fe254f5bfc137604fe2c71292680bf67a1c2'
            '209b01b044877cc986757fa4009a92ea98f480306c2530075d153203c3cd2b3afccab6aacc1453dee8857991e04270572f1700310705d7a0f4d5bed27fab8c67')

_backports=(
  # nspawn: wait for network namespace creation before interface setup (#8633)
  '7511655807e90aa33ea7b71991401a79ec36bb41'
)

_reverts=(
)

_validate_tag() (
  local success fingerprint trusted status tag=v${pkgver%.*}

  cd "$srcdir/${pkgbase/-selinux}-stable"
  parse_gpg_statusfile /dev/stdin < <(git verify-tag --raw "$tag" 2>&1)

  if (( ! success )); then
    error 'failed to validate tag %s\n' "$tag"
    return 1
  fi

  if ! in_array "$fingerprint" "${validpgpkeys[@]}" && (( ! trusted )); then
    error 'unknown or untrusted public key: %s\n' "$fingerprint"
    return 1
  fi

  case $status in
    'expired')
      warning 'the signature has expired'
      ;;
    'expiredkey')
      warning 'the key has expired'
      ;;
  esac

  return 0
)

prepare() {
  cd "${pkgbase/-selinux}-stable"

  # import gpg keys for verification
  gpg --import ../gnupg-keys.gpg

  git remote add -f upstream ../systemd
  git checkout "$_commit"

  local c
  for c in "${_backports[@]}"; do
    git cherry-pick -n "$c"
  done
  for c in "${_reverts[@]}"; do
    git revert -n "$c"
  done

  # Replace cdrom/dialout/tape groups with optical/uucp/storage
  patch -Np1 -i ../0001-Use-Arch-Linux-device-access-groups.patch
}

pkgver() {
  local version count

  cd "${pkgbase/-selinux}-stable"

  version="$(git describe --abbrev=0 --tags)"
  count="$(git rev-list --count ${version}..)"
  printf '%s.%s' "${version#v}" "${count}"
}

build() {
  _validate_tag || return

  local timeservers=({0..3}.arch.pool.ntp.org)

  local meson_options=(
    -Daudit=true
    -Dgnuefi=true
    -Dima=false
    -Dlz4=true
    -Dselinux=true

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    -Ddefault-dnssec=no
    # TODO(dreisner): consider changing this to unified
    -Ddefault-hierarchy=hybrid
    -Ddefault-kill-user-processes=false
    -Dfallback-hostname='archlinux'
    -Dntp-servers="${timeservers[*]}"
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

  arch-meson "${pkgbase/-selinux}-stable" build "${meson_options[@]}"
  ninja -C build
}

check() {
  cd build
  meson test
}


package_systemd-selinux() {
  pkgdesc="system and service manager with SELinux support"
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'bash' 'cryptsetup' 'dbus' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' 'libsystemd-selinux' 'libidn' 'lz4' 'pam-selinux' 'libelf' 'libseccomp'
           'util-linux-selinux' 'xz' 'pcre2' 'audit')
  provides=('nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver"
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=('nss-myhostname' 'systemd-tools' 'udev'
             "${pkgname/-selinux}" 'selinux-systemd')
  optdepends=('libmicrohttpd: remote journald capabilities'
              'quota-tools: kernel-level quota management'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries'
              'polkit: allow administration as unprivileged user')
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

  DESTDIR="$pkgdir" ninja -C build install

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -rv "$pkgdir"/etc/systemd/system/*

  # we'll create this on installation
  rmdir "$pkgdir"/var/log/journal/remote

  # runtime libraries shipped with libsystemd
  install -dm755 libsystemd
  mv "$pkgdir"/usr/lib/lib{nss,systemd,udev}*.so* libsystemd

  # manpages shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/share/man/man8/{halt,poweroff,reboot,runlevel,shutdown,telinit}.8

  # executable (symlinks) shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/bin/{halt,init,poweroff,reboot,runlevel,shutdown,telinit}

  # avoid a potential conflict with [core]/filesystem
  rm "$pkgdir"/usr/share/factory/etc/nsswitch.conf
  sed -i '/^C \/etc\/nsswitch\.conf/d' "$pkgdir"/usr/lib/tmpfiles.d/etc.conf

  # add back tmpfiles.d/legacy.conf, normally omitted without sysv-compat
  install -m644 ${pkgbase/-selinux}-stable/tmpfiles.d/legacy.conf "$pkgdir"/usr/lib/tmpfiles.d

  # ship default policy to leave services disabled
  echo 'disable *' >"$pkgdir"/usr/lib/systemd/system-preset/99-default.preset

  # add mkinitcpio hooks
  install -Dm644 initcpio-install-systemd "$pkgdir"/usr/lib/initcpio/install/systemd
  install -Dm644 initcpio-install-udev "$pkgdir"/usr/lib/initcpio/install/udev
  install -Dm644 initcpio-hook-udev "$pkgdir"/usr/lib/initcpio/hooks/udev

  # ensure proper permissions for /var/log/journal
  # The permissions are stored with named group by tar, so this works with
  # users and groups populated by systemd-sysusers. This is only to prevent a
  # warning from pacman as permissions are set by systemd-tmpfiles anyway.
  install -d -o root -g systemd-journal -m 2755 "$pkgdir"/var/log/journal

  # match directory owner/group and mode from [extra]/polkit
  install -d -o root -g 102 -m 750 "$pkgdir"/usr/share/polkit-1/rules.d

  # add example bootctl configuration
  install -Dm644 arch.conf "$pkgdir"/usr/share/systemd/bootctl/arch.conf
  install -Dm644 loader.conf "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -Dm644 splash-arch.bmp "$pkgdir"/usr/share/systemd/bootctl/splash-arch.bmp

  # pacman hooks
  install -Dm755 systemd-hook "$pkgdir"/usr/share/libalpm/scripts/systemd-hook
  install -Dm644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook

  # overwrite the systemd-user PAM configuration with our own
  install -Dm644 systemd-user.pam "$pkgdir"/etc/pam.d/systemd-user
}

package_libsystemd-selinux() {
  pkgdesc="systemd client libraries with SELinux support"
  depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz' 'libselinux')
  license=('GPL2')
  provides=('libsystemd.so' 'libudev.so'
            "${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=("${pkgname/-selinux}")

  install -dm755 "$pkgdir"/usr
  mv libsystemd "$pkgdir"/usr/lib
}

package_systemd-sysvcompat-selinux() {
  pkgdesc="sysvinit compat for systemd with SELinux support"
  license=('GPL2')
  conflicts=('sysvinit' "${pkgname/-selinux}" 'selinux-systemd-sysvcompat')
  depends=('systemd-selinux')
  provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
            "selinux-systemd-sysvcompat=${pkgver}-${pkgrel}")

  install -Dm644 -t "$pkgdir"/usr/share/man/man8 \
    build/man/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8

  install -dm755 "$pkgdir"/usr/bin
  ln -s ../lib/systemd/systemd "$pkgdir"/usr/bin/init
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s systemctl "$pkgdir"/usr/bin/$tool
  done
}

# vim: ft=sh syn=sh et
