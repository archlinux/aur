# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <buttars0070@gmail.com>
pkgname=tpm
pkgver=1
pkgrel=1
epoch=
pkgdesc="Tmux Plugin Manager"
arch=('i686' 'x86_64')
url="https://github.com/tmux-plugins/tpm"
license=('MIT')
groups=()
depends=('tmux>=1.9','bash')
makedepends=('git')
source=("https://github.com/tmux-plugins/tpm")
md5sums=('SKIP')

#pkgver() {
#  cd ${srcdir}/${_pkgname}
#  git rev-list --count HEAD
#}

package() {
  mkdir -p ~/.tmux/plugins/
  cp -r "${srcdir}/${_pkgname}" ~/.tmux/plugins/tpm
  read -r -p "Would you like to append the tpm config to your .tmux.conf? [y/N] " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo "# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
          
# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'
      
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'" >> ~/.tmux.conf
      echo "TMP config appened to .tmux.conf"
  else
    echo "Add the following to .tmux.conf: "
    echo "
#===========================================
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'
      
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
#===========================================
" 
  fi
  echo "Run: 'tmux source ~/.tmux.conf' or restart tmux"
  echo "Install plugins:
          Add new plugin to ~/.tmux.conf with set -g @plugin '...'
          Press prefix + I (capital I, as in Install) to fetch the plugin."
}
