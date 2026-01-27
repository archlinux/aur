# Maintainer: Giuseppe Angenica <giuseppe.angenica@gmail.com>
pkgname=solvee-git
pkgver=r2.a70a905
pkgrel=1
pkgdesc="A minimal and smart calculator inspired by Numi (v1.1 with variables)"
arch=('any')
url="https://github.com/GiuseppeAngenica/Solvee"
license=('MIT')
depends=('pyside6' 'python-toml')
makedepends=('git')
provides=('solvee')
conflicts=('solvee')
source=('git+https://github.com/GiuseppeAngenica/Solvee.git')
sha256sums=('SKIP')

pkgver() {
  # Entriamo nella cartella con la S maiuscola come su GitHub
  cd "$srcdir/Solvee"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Anche qui, usiamo il nome esatto della cartella
  cd "$srcdir/Solvee"
  
  # Crea le directory
  install -d "${pkgdir}/usr/share/solvee"
  install -d "${pkgdir}/usr/bin"

  # Installa i file
  install -m644 solvee.py "${pkgdir}/usr/share/solvee/solvee.py"
  install -m644 theme.toml "${pkgdir}/usr/share/solvee/theme.toml"

  # Crea il launcher
  echo -e "#!/bin/sh\npython /usr/share/solvee/solvee.py \"\$@\"" > "${pkgdir}/usr/bin/solvee"
  chmod +x "${pkgdir}/usr/bin/solvee"
}
