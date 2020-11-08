# Contributor: Luca Cesari < luca AT cesari DOT me>
_gemname=tmuxinator
pkgname=tmuxinator
pkgver=2.0.2
pkgrel=1
pkgdesc="Manage complex tmux sessions easily"
arch=(any)
url="https://github.com/aziz/tmuxinator"
license=(MIT)
depends=(ruby ruby-erubis ruby-thor 'ruby-xdg>=2.2.5' ruby-rdoc)
makedepends=(rubygems)
source=(http://rubygems.org/downloads/tmuxinator-$pkgver.gem)
noextract=(tmuxinator-$pkgver.gem)
md5sums=('298a13a2798aa7941bfe6e40579a9479')

package() {
    cd $srcdir
    export HOME='/tmp'
    local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
    install -d -m 755 ${pkgdir}/usr/bin
    gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n ${pkgdir}/usr/bin ${_gemname}-${pkgver}.gem

    rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
    mkdir -p "${pkgdir}/usr/share/tmuxinator"
    install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.bash" "${pkgdir}/usr/share/tmuxinator/completion.bash"
    install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.fish" "${pkgdir}/usr/share/tmuxinator/completion.fish"
    install -D -m 644 "${pkgdir}/${_gemdir}/gems/tmuxinator-${pkgver}/completion/tmuxinator.zsh" "${pkgdir}/usr/share/tmuxinator/completion.zsh"
    install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 :
