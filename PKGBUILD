pkgname=ascii-term
pkgver=1.0.1
pkgrel=1
pkgdesc="Display ASCII art in your terminal."
maintainer="Marcos Roque <devmarcosdanielr@gmail.com>"
url="https://github.com/marcosdanielr/ascii-term"
arch=('x86_64')
license=('MIT')
makedepends=('git')
source=("git+https://github.com/marcosdanielr/ascii-term.git")

package() {
    local config_dir="$HOME/.config/ascii-term"
    mkdir -p "$config_dir"

    if [[ ! -f "$config_dir/ascii.txt" ]]; then
        cat <<EOF >"$config_dir/ascii.txt"
                              _          _ _       
                             | |__   ___| | | ___  
                             | '_ \ / _ \ | |/ _ \ 
                             | | | |  __/ | | (_) |
                             |_| |_|\___|_|_|\___/ 
EOF
        echo "ascii.txt file created."
    fi

    if [[ ! -f "$config_dir/color.txt" ]]; then
        echo -e "\x1b[38;5;105m" >"$config_dir/color.txt"
        echo "color.txt file created."
    fi

    install -Dm755 "$srcdir/ascii-term/ascii_term" "$pkgdir/usr/bin/ascii-term"

    chmod 755 "$pkgdir/usr/bin/ascii-term"
    chmod -R 755 "$config_dir"

    if [[ -f "$HOME/.bashrc" ]]; then
        echo "ascii-term" >>"$HOME/.bashrc"
    elif [[ -f "$HOME/.zshrc" ]]; then
        echo "ascii-term" >>"$HOME/.zshrc"
    fi
}
sha256sums=('SKIP')
