pkgver=1.0.0
pkgname=interact
pkgrel=1
arch=(any)
depends=('rlwrap')
url="https://github.com/ahy4/interact"
package() {
    mkdir -p "${pkgdir}/usr/local/bin"
cat <<EOF > "${pkgdir}/usr/local/bin/_interact"
#!/usr/bin/env bash

cmd=$*
while true ; do
  echo -ne "\033[34m[ $cmd ] >> \033[00m"
  read args
  line=$cmd" "$args
  $line
done
EOF
cat <<EOF > "${pkgdir}/usr/local/bin/interact"
#!/usr/bin/env bash

rlwrap _interact "$*"
EOF
chmod +x "${pkgdir}/usr/local/bin/interact"
chmod +x "${pkgdir}/usr/local/bin/_interact"
}
