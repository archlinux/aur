pkgname=fancylock-bin
pkgver=0.0.7
pkgrel=1
arch=('x86_64')
url="https://github.com/tuxx/fancylock"
license=('MIT')
depends=('mpv' 'pam')
provides=('fancylock')
options=('!debug')
conflicts=('fancylock')
source=("https://github.com/tuxx/fancylock/releases/download/v${pkgver}/fancylock-linux-amd64.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 fancylock-linux-amd64 "$pkgdir/usr/bin/fancylock"
  if [ ! -f /etc/pam.d/fancylock ]; then
  install -d "$pkgdir/etc/pam.d"
    cat > "$pkgdir/etc/pam.d/fancylock" <<EOF
#%PAM-1.0
# /etc/pam.d/fancylock - PAM configuration for fancylock screen locker
auth       required   pam_env.so
auth       required   pam_unix.so try_first_pass
account    required   pam_nologin.so
account    required   pam_unix.so
session    required   pam_limits.so
session    required   pam_unix.so
EOF
  fi
}
